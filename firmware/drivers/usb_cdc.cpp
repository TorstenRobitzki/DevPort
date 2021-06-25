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

#define CDCD_ECHO_BUF_SIZ CONF_USB_CDCD_ACM_DATA_BULKIN_MAXPKSZ_HS

static struct usbd_descriptors single_desc[] = {
    {
        single_desc_bytes, single_desc_bytes + sizeof(single_desc_bytes)
    },
    {
        single_desc_bytes_hs, single_desc_bytes_hs + sizeof(single_desc_bytes_hs)
    }
};

static uint8_t ctrl_buffer[64];

usb_cdc_base::usb_cdc_base()
{
    error_handler( usbdc_init( ctrl_buffer ) );

    /* usbdc_register_funcion inside */
    error_handler( cdcdf_acm_init() );

    error_handler( usbdc_start(single_desc) );
    usbdc_attach();
}

void usb_cdc_base::read_usb_cdc( std::uint8_t* buffer, std::size_t buffer_size )
{
    error_handler( cdcdf_acm_read(buffer, buffer_size) );
}

void usb_cdc_base::write_usb_cdc( const std::uint8_t* buffer, std::size_t buffer_size )
{
    error_handler( cdcdf_acm_write( const_cast< std::uint8_t* >( buffer ), buffer_size ) );
}
