#include "drivers/async_i2c.hpp"

#include <hal_gpio.h>

#include <algorithm>
#include <iterator>
#include <cassert>

namespace {
    struct interface_instance {
        SercomI2cm*                     interface;
        async_i2c_interrupt_handler*    instance;
    };

    static interface_instance interface_instances[ SERCOM_INST_NUM ] = {
        { &SERCOM0->I2CM, nullptr },
        { &SERCOM1->I2CM, nullptr },
        { &SERCOM2->I2CM, nullptr },
        { &SERCOM3->I2CM, nullptr },
        { &SERCOM4->I2CM, nullptr },
        { &SERCOM5->I2CM, nullptr },
    };

    interface_instance& instance( SercomI2cm const* i2c)
    {
        const auto pos = std::find_if( std::begin( interface_instances ), std::end( interface_instances ), [ i2c ]( const auto& inst ) -> bool {
            return i2c == inst.interface;
        } );

        assert( pos != std::end( interface_instances ) );

        return *pos;
    }

    const interface_instance& instance( int id )
    {
        assert( id >= 0 && static_cast< std::size_t >( id ) < std::size( interface_instances ) );

        const interface_instance& interface = interface_instances[ id ];
        assert( interface.instance );

        return interface;
    }

    int first_irq( const interface_instance& i )
    {
        static constexpr int num_interrupts_per_instance = 4;

        return SERCOM0_0_IRQn + static_cast< int >( std::distance( std::cbegin( interface_instances ), &i ) * num_interrupts_per_instance );
    }
}

#define CONF_GCLK_SERCOM5_CORE_FREQUENCY 12000000
#define CONF_SERCOM_5_I2CM_BAUD 100000
#define CONF_SERCOM_5_I2CM_TRISE 215
#define CONF_SERCOM_5_I2CM_BAUD_BAUDLOW                                                                                \
    (((CONF_GCLK_SERCOM5_CORE_FREQUENCY - (CONF_SERCOM_5_I2CM_BAUD * 10U)                                              \
       - (CONF_SERCOM_5_I2CM_TRISE * (CONF_SERCOM_5_I2CM_BAUD / 100U) * (CONF_GCLK_SERCOM5_CORE_FREQUENCY / 10000U)    \
          / 1000U))                                                                                                    \
          * 10U                                                                                                        \
      + 5U)                                                                                                            \
     / (CONF_SERCOM_5_I2CM_BAUD * 10U))


// Syncronization is done at the latest point in time possible.
// That is directly before register access, not after.
static void wait_for_sysop_synchronization( SercomI2cm* i2c )
{
    while ( i2c->SYNCBUSY.reg & SERCOM_I2CM_SYNCBUSY_SYSOP )
        ;
}

static void wait_for_enable_synchronization( SercomI2cm* i2c )
{
    while ( i2c->SYNCBUSY.reg & SERCOM_I2CM_SYNCBUSY_ENABLE )
        ;
}

static void enable_irq( int id )
{
    const IRQn_Type irq_id = static_cast< IRQn_Type >( id );

    NVIC_DisableIRQ( irq_id );
    NVIC_ClearPendingIRQ( irq_id );
    NVIC_EnableIRQ( irq_id );
}

async_i2c_base::async_i2c_base( SercomI2cm* i2c )
    : current_event_( event::none )
    , write_size_( 0 )
    , read_size_( 0 )
{
    static constexpr auto i2c_master_mode    = 0x5;
    static constexpr auto i2c_bus_state_idle = 0x01;

    wait_for_enable_synchronization( i2c );

    // TODO
    i2c->BAUD.reg   = SERCOM_I2CM_BAUD_BAUD(0x35) | SERCOM_I2CM_BAUD_BAUD(0x36);
    i2c->CTRLB.reg  = ( i2c->CTRLB.reg | SERCOM_I2CM_CTRLB_SMEN );
    i2c->CTRLA.reg  = ( i2c->CTRLA.reg & ~SERCOM_I2CM_CTRLA_MODE_Msk )
        | SERCOM_I2CS_CTRLA_MODE( i2c_master_mode )
        | SERCOM_I2CS_CTRLA_ENABLE
        | SERCOM_I2CS_CTRLA_SCLSM;

    wait_for_sysop_synchronization( i2c );
    i2c->STATUS.reg = SERCOM_I2CM_STATUS_BUSSTATE( i2c_bus_state_idle );

    interface_instance& inst = instance( i2c );
    inst.instance = this;

    static const auto write_irq_offs = 0;
    static const auto read_irq_offs  = 1;
    static const auto error_irq_offs = 2;

    const int irq_id = first_irq( inst );
    enable_irq( irq_id + write_irq_offs );
    enable_irq( irq_id + read_irq_offs );
    enable_irq( irq_id + error_irq_offs );

    i2c->INTENSET.reg = SERCOM_I2CM_INTENSET_MB | SERCOM_I2CM_INTENSET_SB | SERCOM_I2CM_INTENSET_ERROR;
}

static constexpr auto i2c_read_flag    = 0x1;

void async_i2c_base::write_read_impl( SercomI2cm* i2c, std::uint8_t device_address, const std::uint8_t* write_data, std::size_t write_size, std::uint8_t* read_data, std::size_t read_size )
{
    assert( write_size + read_size != 0 );
    assert( write_size == 0 || write_data != nullptr );
    assert( read_size == 0 || read_data != nullptr );
    assert( write_size_ == 0 );
    assert( read_size_ == 0 );

    write_data_ = write_data;
    write_size_ = write_size;
    read_data_  = read_data;
    read_size_  = read_size;

    wait_for_sysop_synchronization( i2c );
    i2c->ADDR.reg = ( i2c->ADDR.reg & ~SERCOM_I2CM_ADDR_ADDR_Msk ) | SERCOM_I2CM_ADDR_ADDR( device_address << 1 ) | ( write_size_ == 0 ? i2c_read_flag : 0 );
}

async_i2c_base::event async_i2c_base::pending_event()
{
    const async_i2c_base::event result = current_event_;
    current_event_ = event::none;

    return result;
}

static constexpr auto i2c_repeated_start_command = 0x1;
static constexpr auto i2c_stop_command           = 0x3;

static void issue_stop( SercomI2cm* i2c )
{
    wait_for_sysop_synchronization( i2c );
    i2c->CTRLB.reg = ( i2c->CTRLB.reg & ~( SERCOM_I2CM_CTRLB_CMD_Msk ) ) | SERCOM_I2CM_CTRLB_CMD( i2c_stop_command );
}

void async_i2c_base::write_interrupt( SercomI2cm* i2c )
{
    if ( write_size_ )
    {
        wait_for_sysop_synchronization( i2c );
        i2c->DATA.reg = *write_data_;
        ++write_data_;
        --write_size_;
    }
    else if ( read_size_ )
    {
        wait_for_sysop_synchronization( i2c );
        i2c->CTRLB.reg = ( i2c->CTRLB.reg & ~(  SERCOM_I2CM_CTRLB_ACKACT ) )
            | ( ( read_size_ > 1 ) ? 0 : SERCOM_I2CM_CTRLB_ACKACT );

        wait_for_sysop_synchronization( i2c );
        i2c->ADDR.reg = i2c->ADDR.reg | i2c_read_flag;
    }
    else
    {
        issue_stop( i2c );
        current_event_ = event::write_read_done;
    }
}

void async_i2c_base::read_interrupt(SercomI2cm* i2c)
{
    assert( read_size_ );

    if ( read_size_ == 1 )
    {
        issue_stop( i2c );
    }

   *read_data_ = static_cast< std::uint8_t >( i2c->DATA.reg & 0xff );
    --read_size_;
    ++read_data_;

    if ( read_size_ == 0 )
    {
        current_event_ = event::write_read_done;
    }
}

void async_i2c_base::error_interrupt(SercomI2cm* i2c)
{
    for ( ;; );
    (void)i2c;
}

void handle_write_interrupt(int id)
{
    const interface_instance& interface = instance( id );
    interface.instance->write_interrupt( interface.interface );
}

void handle_read_interrupt(int id)
{
    const interface_instance& interface = instance( id );
    interface.instance->read_interrupt( interface.interface );
}

void handle_error_interrupt(int id)
{
    const interface_instance& interface = instance( id );
    interface.instance->error_interrupt( interface.interface );
}

#define DECLARE_INTERRUPT_HANDLER(sercom_id) \
                                                        \
extern "C" void SERCOM##sercom_id##_0_Handler()         \
{                                                       \
    handle_write_interrupt(sercom_id);                  \
}                                                       \
                                                        \
extern "C" void SERCOM##sercom_id##_1_Handler()         \
{                                                       \
    handle_read_interrupt(sercom_id);                   \
}                                                       \
                                                        \
extern "C" void SERCOM##sercom_id##_3_Handler()         \
{                                                       \
    handle_error_interrupt(sercom_id);                  \
}                                                       \

DECLARE_INTERRUPT_HANDLER(0)
DECLARE_INTERRUPT_HANDLER(1)
DECLARE_INTERRUPT_HANDLER(2)
DECLARE_INTERRUPT_HANDLER(3)
DECLARE_INTERRUPT_HANDLER(4)
DECLARE_INTERRUPT_HANDLER(5)
