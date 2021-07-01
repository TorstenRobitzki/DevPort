#include "drivers/usb_cdc.hpp"
#include "drivers/error_handler.hpp"

extern "C"
{
#   include "cdcdf_acm.h"
#   include "cdcdf_acm_desc.h"
}

static uint8_t single_desc_bytes[] = {
    /* Device descriptors and Configuration descriptors list. */
    CDCD_ACM_HS_DESCES_LS_FS
};

static uint8_t single_desc_bytes_hs[] = {
    /* Device descriptors and Configuration descriptors list. */
    CDCD_ACM_HS_DESCES_HS
};

static struct usbd_descriptors single_desc[] = {
    {
        single_desc_bytes, single_desc_bytes + sizeof(single_desc_bytes)
    },
    {
        single_desc_bytes_hs, single_desc_bytes_hs + sizeof(single_desc_bytes_hs)
    }
};

static ring_buffer< 4, usb_cdc_base::event >* event_queue = nullptr;

namespace {

extern "C" bool usb_on_read(const uint8_t /* ep */, const enum usb_xfer_code /* code */, std::uint32_t count )
{
    assert( event_queue );

    const usb_cdc_base::event event = { usb_cdc_base::event_type::read, count };
    event_queue->put( &event, 1 );

    return false;
}

extern "C" bool usb_on_write(const uint8_t /* ep */, const enum usb_xfer_code /* code */, std::uint32_t count )
{
    assert( event_queue );

    const usb_cdc_base::event event = { usb_cdc_base::event_type::write, count };
    event_queue->put( &event, 1 );

    return false;
}

extern "C" bool usb_on_device_state_changed( usb_cdc_control_signal_t state )
{
    assert( event_queue );

    if ( state.rs232.DTR )
    {
        cdcdf_acm_register_callback( CDCDF_ACM_CB_WRITE, reinterpret_cast< FUNC_PTR >( usb_on_write ) );
        cdcdf_acm_register_callback( CDCDF_ACM_CB_READ, reinterpret_cast< FUNC_PTR >( usb_on_read ) );

        const usb_cdc_base::event event = { usb_cdc_base::event_type::connected, 0 };
        event_queue->put( &event, 1 );
    }
    else
    {
        const usb_cdc_base::event event = { usb_cdc_base::event_type::disconnected, 0 };
        event_queue->put( &event, 1 );
    }

    return false;
}

}

static uint8_t ctrl_buffer[64];


usb_cdc_base::usb_cdc_base()
{
    event_queue = &event_queue_;

    error_handler( usbdc_init( ctrl_buffer ) );

    /* usbdc_register_funcion inside */
    error_handler( cdcdf_acm_init() );

    error_handler( usbdc_start(single_desc) );
    usbdc_attach();

    cdcdf_acm_register_callback( CDCDF_ACM_CB_STATE_C, reinterpret_cast< FUNC_PTR >( usb_on_device_state_changed ) );
}

void usb_cdc_base::read_usb_cdc( std::uint8_t* buffer, std::size_t buffer_size )
{
    error_handler( cdcdf_acm_read(buffer, buffer_size) );
}

void usb_cdc_base::write_usb_cdc( const std::uint8_t* buffer, std::size_t buffer_size )
{
    error_handler( cdcdf_acm_write( const_cast< std::uint8_t* >( buffer ), buffer_size ) );
}

std::optional< usb_cdc_base::event > usb_cdc_base::get_event()
{
    assert( event_queue );

    usb_cdc_base::event event;
    if ( event_queue->get( &event, 1 ) )
    {
        return std::optional< usb_cdc_base::event >( event );
    }

    return std::optional< usb_cdc_base::event >();

}
