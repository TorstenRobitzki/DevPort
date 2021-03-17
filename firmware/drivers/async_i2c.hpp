#ifndef DRIVERS_ASYNC_I2C_HPP
#define DRIVERS_ASYNC_I2C_HPP

#include <sam.h>

#include <cstdint>

class async_i2c_interrupt_handler
{
public:
    virtual void write_interrupt(SercomI2cm* i2c) = 0;
    virtual void read_interrupt(SercomI2cm* i2c)  = 0;
    virtual void error_interrupt(SercomI2cm* i2c) = 0;
};

class async_i2c_base : async_i2c_interrupt_handler
{
protected:
    explicit async_i2c_base( SercomI2cm* );

    enum class event {
        none,
        write_read_done,
        error_occurred
    };

    event pending_event();

    void write_read_impl( SercomI2cm* i2c, std::uint8_t device_address, const std::uint8_t* write_data, std::size_t write_size, std::uint8_t* read_data, std::size_t read_size );

private:
    virtual void write_interrupt(SercomI2cm* i2c) final;
    virtual void read_interrupt(SercomI2cm* i2c)  final;
    virtual void error_interrupt(SercomI2cm* i2c) final;

    volatile event current_event_;

    volatile const std::uint8_t* write_data_;
    volatile std::size_t         write_size_;
    volatile std::uint8_t*       read_data_;
    volatile std::size_t         read_size_;
};

template < class CallBacks, std::uint32_t InterfaceBaseAddr >
class async_i2c : async_i2c_base
{
public:
    async_i2c() : async_i2c_base( instance() )
    {
    }

    void write_read( std::uint8_t device_address, const std::uint8_t* write_data, std::size_t write_size, std::uint8_t* read_data, std::size_t read_size );

    bool handle_events();

    async_i2c( const async_i2c& ) = delete;
    async_i2c& operator=( const async_i2c& ) = delete;

private:
    static SercomI2cm* instance();
};

template < std::uint32_t InterfaceBaseAddr >
struct async_i2c_instance {
    template < class CallBacks >
    using type = async_i2c< CallBacks, InterfaceBaseAddr >;
};

template < class CallBacks, std::uint32_t InterfaceBaseAddr >
void async_i2c< CallBacks, InterfaceBaseAddr >::write_read( std::uint8_t device_address, const std::uint8_t* write_data, std::size_t write_size, std::uint8_t* read_data, std::size_t read_size )
{
    write_read_impl( instance(), device_address, write_data, write_size, read_data, read_size );
}

template < class CallBacks, std::uint32_t InterfaceBaseAddr >
bool async_i2c< CallBacks, InterfaceBaseAddr >::handle_events()
{
    const auto evt = pending_event();

    switch ( evt )
    {
        case event::write_read_done:
            static_cast< CallBacks& >( *this ).on_i2c_write_read_done();
            break;

        case event::error_occurred:
            static_cast< CallBacks& >( *this ).on_i2c_error_occurred();
            break;

        default:
            return false;
    }

    return true;
}

template < class CallBacks, std::uint32_t InterfaceBaseAddr >
SercomI2cm* async_i2c< CallBacks, InterfaceBaseAddr >::instance()
{
    return reinterpret_cast< SercomI2cm* >( InterfaceBaseAddr );
}

#endif
