#ifndef FIRMWARE_DRIVERS_PORT_HUB_HPP
#define FIRMWARE_DRIVERS_PORT_HUB_HPP

#include <hpl_i2c_m_async.h>

class port_hub_base : private _i2c_m_async_device
{
public:
    explicit port_hub_base( Sercom* instance );

private:
    _i2c_m_async_device* device();
};

template < class Callbacks >
class port_hub : public port_hub_base
{
public:
    explicit port_hub( Sercom* instance ) : port_hub_base( instance ) {}

    bool handle_events();
};

#endif
