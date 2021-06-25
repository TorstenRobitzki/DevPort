#ifndef FIRMWARE_DRIVERS_USB_CDC_HPP
#define FIRMWARE_DRIVERS_USB_CDC_HPP

#include <cstdint>
#include <cstddef>

class usb_cdc_base
{
public:
    usb_cdc_base();

    void read_usb_cdc( std::uint8_t* buffer, std::size_t buffer_size );
    void write_usb_cdc( const std::uint8_t* buffer, std::size_t buffer_size );
};

template < class Callbacks >
class usb_cdc : public usb_cdc_base
{
};

#endif
