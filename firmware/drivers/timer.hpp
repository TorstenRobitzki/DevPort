#ifndef DRIVERS_TIMER_HPP
#define DRIVERS_TIMER_HPP

#include <sam.h>

#include <cstdint>

class timer_interrupt_handler
{
public:
    virtual void interrupt_handler( Tc* timer ) = 0;
};

class timer_base : private timer_interrupt_handler
{
protected:
    explicit timer_base( Tc* timer, std::uint32_t interval_ms );

    bool pending_timeout();

private:
    virtual void interrupt_handler( Tc* timer ) final;

    volatile bool timeout_;
};

template < class Callbacks, std::uint32_t InterfaceBaseAddr >
class timer : private timer_base
{
public:
    explicit timer( std::uint32_t interval_ms )
        : timer_base( instance(), interval_ms )
    {
    }

    bool handle_events();

    timer( const timer& ) = delete;
    timer& operator=( const timer& ) = delete;

private:
    Tc* instance() const;
};

template < std::uint32_t InterfaceBaseAddr >
struct timer_instance {
    template < class CallBacks >
    using type = timer< CallBacks, InterfaceBaseAddr >;
};

template < class Callbacks, std::uint32_t InterfaceBaseAddr >
bool timer< Callbacks, InterfaceBaseAddr >::handle_events()
{
    const bool timeout = pending_timeout();

    if ( timeout )
        static_cast< Callbacks& >( *this ).on_timeout();

    return timeout;
}

template < class Callbacks, std::uint32_t InterfaceBaseAddr >
Tc* timer< Callbacks, InterfaceBaseAddr >::instance() const
{
    return reinterpret_cast< Tc* >( InterfaceBaseAddr );
}

#endif
