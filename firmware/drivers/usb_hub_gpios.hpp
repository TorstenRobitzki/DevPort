#ifndef FIRMWARE_DRIVER_USB_HUB_GPIOS_HPP
#define FIRMWARE_DRIVER_USB_HUB_GPIOS_HPP

#include "drivers/layout.hpp"

template < class Callbacks >
class usb_hub_gpios
{
public:
    usb_hub_gpios();

    void deassert_hub_reset_pin();

    bool handle_events() { return false; }
};


template < class Callbacks >
usb_hub_gpios< Callbacks >::usb_hub_gpios()
{
    gpio_set_pin_direction( hub_reset_local_pin, GPIO_DIRECTION_OUT );
    gpio_set_pin_direction( hs_up_pin, GPIO_DIRECTION_IN );
    gpio_set_pin_direction( ss_up_pin, GPIO_DIRECTION_IN );

    gpio_set_pin_level( hub_reset_local_pin, false );
}

template < class Callbacks >
void usb_hub_gpios< Callbacks >::deassert_hub_reset_pin()
{
    gpio_set_pin_level( hub_reset_local_pin, true );
}

#endif
