#ifndef FIRMWARE_DRIVERS_USB_CDC_HPP
#define FIRMWARE_DRIVERS_USB_CDC_HPP

#include "drivers/ring_buffer.hpp"

#include <cstdint>
#include <cstddef>
#include <optional>

class usb_cdc_base
{
public:
    usb_cdc_base();

    /**
     * @brief issue a read from the serial port
     */
    void read_usb_cdc( std::uint8_t* buffer, std::size_t buffer_size );

    /**
     * @brief issue a write to the serial port
     */
    void write_usb_cdc( const std::uint8_t* buffer, std::size_t buffer_size );

    enum class event_type
    {
        connected,
        disconnected,
        read,
        write
    };

    struct event
    {
        event_type  type;
        std::size_t size;
    };

protected:

    std::optional< event > get_event();

private:

    ring_buffer< 4, event > event_queue_;
};

template < class Callbacks >
class usb_cdc : public usb_cdc_base
{
public:
    bool handle_events()
    {
        const auto event = get_event();

        if ( event )
        {
            switch ( event->type )
            {
                case event_type::connected:
                    static_cast< Callbacks& >( *this ).on_cdc_connected();
                    break;

                case event_type::disconnected:
                    static_cast< Callbacks& >( *this ).on_cdc_disconnect();
                    break;

                case event_type::read:
                    static_cast< Callbacks& >( *this ).on_cdc_read( event->size );
                    break;

                case event_type::write:
                    static_cast< Callbacks& >( *this ).on_cdc_write( event->size );
                    break;
            }
        }

        return !!event;
    }
};

#endif
