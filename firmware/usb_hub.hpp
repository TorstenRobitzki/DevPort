#ifndef FIRMWARE_USB_HUB_HPP
#define FIRMWARE_USB_HUB_HPP

template < template < class > class I2C, template < class > class GPIO >
class usb_hub
    : public I2C< usb_hub< I2C, GPIO > >
    , public GPIO< usb_hub< I2C, GPIO > >
{
public:
    usb_hub();

    bool handle_events();

    void on_i2c_write_read_done() {
        if ( state_ == 1 )
            state_ = 2;
    }
    void on_i2c_error_occurred() {}
private:
    static constexpr std::uint8_t i2c_address = 0x44;

    int state_ = 0;
};

template < template < class > class I2C, template < class > class GPIO >
usb_hub< I2C, GPIO >::usb_hub()
{
}

template < template < class > class I2C, template < class > class GPIO >
bool usb_hub< I2C, GPIO >::handle_events()
{
    bool result =
        I2C< usb_hub< I2C, GPIO > >::handle_events()
     || GPIO< usb_hub< I2C, GPIO > >::handle_events();

    if ( state_ == 0 )
    {
        this->deassert_hub_reset_pin();

        static std::uint8_t addr = 0x8;
        static std::uint8_t value;
        this->write_read( i2c_address, &addr, 1, &value, 1 );

        ++state_;
    }
    else if ( state_ == 2 )
    {
        static std::uint8_t command[ 2 ] = { 0xF8, 0x01 };
        this->write_read( i2c_address, command, 2, nullptr, 0 );

        ++state_;
    }

    return result;
}


#endif
