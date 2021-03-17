#ifndef FIRMWARE_PORT_HUBS_HPP
#define FIRMWARE_PORT_HUBS_HPP

enum class port_color {
    red,
    green,
    blue,
    white
};

enum class port_blink_pattern {
    off,
    solid,
    blink
};

template <
    template < class > class I2C0,
    template < class > class Timer >
class port_hubs :
    public I2C0< port_hubs< I2C0, Timer > >,
    public Timer< port_hubs< I2C0, Timer > >
{
public:
    port_hubs();

    void on_i2c_write_read_done();
    void on_i2c_error_occurred();
    void on_timeout();

    bool handle_events();

    void port_led( int port_id, port_color color, port_blink_pattern );

private:
    void next_step();
    void next_port_update();
    void color_update( int led_idx, std::uint32_t color );
    void brightness_update( int led_idx, std::uint8_t brightness );

    I2C0< port_hubs< I2C0, Timer > >& i2c();

    enum class state {
        idle,
        init_brightness1,
        init_brightness2,
        enable_leds1,
        enable_leds2,
        updateing,
    } state_ = state::init_brightness1;

    bool init_ = false;

    enum required_updates {
        requires_color_update        = 0x0001,
        requires_brightness_update   = 0x0002,

        requires_updates = requires_color_update | requires_brightness_update
    };

    struct port_led_state {
        std::uint32_t       color;
        std::uint32_t       pattern_state;
        port_blink_pattern  pattern;
        std::uint32_t       needs_update;
    };

    static constexpr std::size_t num_led_per_port  = 2;
    static constexpr std::size_t num_ports_per_hub = 4;
    static constexpr std::size_t num_hubs          = 1;

    port_led_state led_states_[ num_led_per_port * num_ports_per_hub * num_hubs ];
};

#endif
