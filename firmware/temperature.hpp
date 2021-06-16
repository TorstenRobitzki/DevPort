#ifndef FIRMWARE_TEMPERATURE_HPP
#define FIRMWARE_TEMPERATURE_HPP

#include <cstdint>
#include <optional>
#include <array>

/**
 * @brief access class to the temperature sensor
 */
template < template < class > class I2C >
class temperature : public I2C< temperature< I2C > >
{
public:
    void start_read_temperature();

    std::optional< std::uint32_t > new_temperature();

    bool handle_events();

    void on_i2c_write_read_done();
    void on_i2c_error_occurred();
private:
    static constexpr std::uint8_t device_addr = 0x48;

    using i2c_t = I2C< temperature< I2C > >;

    std::uint8_t read_buffer_[ 2 ];
    bool data_available_ = false;
};

// implementation
template < template < class > class I2C >
void temperature< I2C >::start_read_temperature()
{
    static const std::uint8_t reg_addr = 0;

    data_available_ = false;
    this->write_read( device_addr, &reg_addr, 1, read_buffer_, std::size( read_buffer_ ) );
}

template < template < class > class I2C >
std::optional< std::uint32_t > temperature< I2C >::new_temperature()
{
    const bool new_temp = data_available_;
    data_available_ = false;

    return new_temp
        ? std::optional< std::uint32_t >( ( read_buffer_[ 0 ] << 8 ) | read_buffer_[ 1 ] )
        : std::optional< std::uint32_t >();
}

template < template < class > class I2C >
bool temperature< I2C >::handle_events()
{
    return i2c_t::handle_events();
}

template < template < class > class I2C >
void temperature< I2C >::on_i2c_write_read_done()
{
    data_available_ = true;
}

template < template < class > class I2C >
void temperature< I2C >::on_i2c_error_occurred()
{
}

#endif
