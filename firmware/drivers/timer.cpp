#include "drivers/timer.hpp"

#include <algorithm>
#include <iterator>
#include <cassert>

namespace {
    struct interface_instance {
        Tc*                      interface;
        timer_interrupt_handler* instance;
    };

    static interface_instance interface_instances[ TC_INST_NUM ] = {
        { TC0, nullptr },
        { TC1, nullptr },
        { TC2, nullptr },
        { TC3, nullptr },
        { TC4, nullptr },
        { TC5, nullptr }
    };
}

timer_base::timer_base( Tc* timer, std::uint32_t interval_ms )
    : timeout_( false )
{
    const auto pos = std::find_if( std::begin( interface_instances ), std::end( interface_instances ), [ timer ]( const auto& i ){
        return i.interface == timer;
    });

    assert( pos != std::end( interface_instances ) );
    assert( pos->instance == nullptr );

    pos->instance = this;

    // TODO
    timer->COUNT32.CC[ 0 ].reg = 1000 * interval_ms / 18;
    timer->COUNT32.WAVE.reg    = TC_WAVE_WAVEGEN_MFRQ;
    timer->COUNT32.CTRLA.reg   = TC_CTRLA_MODE_COUNT16 | TC_CTRLA_ENABLE | TC_CTRLA_PRESCALER_DIV1024;

    timer->COUNT32.INTENSET.bit.OVF = 1;
    const IRQn_Type irq_id = static_cast< IRQn_Type >( TC0_IRQn + std::distance( std::begin( interface_instances ), pos ) );

    NVIC_DisableIRQ( irq_id );
    NVIC_ClearPendingIRQ( irq_id );
    NVIC_EnableIRQ( irq_id );
}

bool timer_base::pending_timeout()
{
    const bool result = timeout_;
    timeout_ = false;

    return result;
}

void timer_base::interrupt_handler( Tc* timer )
{
    timer->COUNT16.INTFLAG.bit.OVF = 1;
    timeout_ = true;
}

static void call_interrupt_handler( int id )
{
    interface_instance& inst = interface_instances[ id ];
    assert( inst.instance );

    inst.instance->interrupt_handler( inst.interface );
}

extern "C" void TC0_Handler()
{
    call_interrupt_handler( 0 );
}

extern "C" void TC1_Handler()
{
    call_interrupt_handler( 1 );
}

extern "C" void TC2_Handler()
{
    call_interrupt_handler( 2 );
}

extern "C" void TC3_Handler()
{
    call_interrupt_handler( 3 );
}

extern "C" void TC4_Handler()
{
    call_interrupt_handler( 4 );
}

extern "C" void TC5_Handler()
{
    call_interrupt_handler( 5 );
}
