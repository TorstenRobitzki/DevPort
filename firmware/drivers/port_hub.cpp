#include "drivers/port_hub.hpp"
#include "drivers/error_handler.hpp"

typedef void (*_i2c_complete_cb_t)(struct _i2c_m_async_device *i2c_dev);
typedef void (*_i2c_error_cb_t)(struct _i2c_m_async_device *i2c_dev, int32_t errcode);

port_hub_base::port_hub_base( Sercom* instance )
    : _i2c_m_async_device{}
{
    error_handler( _i2c_m_async_init( device(), instance ) );
    error_handler( _i2c_m_async_enable( device() ) );
    // TODO
    // error_handler( _i2c_m_async_set_baudrate( device(), 12000000, 100 ) );

    hri_sercomi2cm_set_CTRLB_SMEN_bit( device()->hw );

    uint8_t irq = _sercom_get_irq_num(hw);
    for (uint32_t i = 0; i < 4; i++) {
        NVIC_DisableIRQ((IRQn_Type)irq);
        NVIC_ClearPendingIRQ((IRQn_Type)irq);
        NVIC_EnableIRQ((IRQn_Type)irq);
        irq++;
    }
}

static _i2c_m_msg msg;
static uint8_t buffer[4];

void port_hub_base::port_light_color()
{
    // I2C_M_RD
    msg.addr    = 0x14;
    msg.flags   = I2C_M_SEVEN /* | I2C_M_RD */;
    msg.len     = 2;
    msg.buffer  = buffer;
    buffer[ 0 ] = 0x01;
    buffer[ 1 ] = 0xf0;

    error_handler( _i2c_m_async_transfer( device(), &msg ) );
}

_i2c_m_async_device* port_hub_base::device()
{
    return this;
}


extern "C" void SERCOM5_0_Handler(void)
{
}

extern "C" void SERCOM5_1_Handler(void)
{
}

extern "C" void SERCOM5_2_Handler(void)
{
}

extern "C" void SERCOM5_3_Handler(void)
{
}

