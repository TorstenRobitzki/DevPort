#include <sam.h>
#include <system_samd51.h>
#include <hal_gpio.h>
#include <hal_init.h>
#include <parts.h>

#include "drivers/error_handler.hpp"
#include "drivers/async_i2c.hpp"

static void toggle()
{
    gpio_set_pin_level( GPIO( GPIO_PORTA, 16 ), true );
    gpio_set_pin_level( GPIO( GPIO_PORTA, 16 ), false );
}

static const std::uint8_t register_addr = 1;
static std::uint8_t register_content = 0xaa;


struct me : async_i2c< me, 0x43000400UL > {
    void on_i2c_write_read_done() {
        for ( ;; )
            ;
    }

    void on_i2c_error_occurred() {
        assert( false );
    }
};

//extern "C" void end() {}
extern "C" void main_entry()
{
    SystemInit();
    init_mcu();

    gpio_set_pin_direction( GPIO( GPIO_PORTA, 16 ), GPIO_DIRECTION_OUT );
    toggle();

    gpio_set_pin_direction( GPIO( GPIO_PORTB, 2 ), GPIO_DIRECTION_IN );
    gpio_set_pin_direction( GPIO( GPIO_PORTB, 3 ), GPIO_DIRECTION_IN );
    // gpio_set_pin_pull_mode( GPIO( GPIO_PORTB, 2 ), GPIO_PULL_UP );
    // gpio_set_pin_pull_mode( GPIO( GPIO_PORTB, 3 ), GPIO_PULL_UP );

toggle();
    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM5_GCLK_ID_CORE, GCLK_PCHCTRL_GEN_GCLK0_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));
    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM5_GCLK_ID_SLOW, GCLK_PCHCTRL_GEN_GCLK3_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));
toggle();
    hri_mclk_set_APBDMASK_SERCOM5_bit(MCLK);

toggle();
toggle();

    gpio_set_pin_function( GPIO( GPIO_PORTB, 2 ), PINMUX_PB02D_SERCOM5_PAD0 );
    gpio_set_pin_function( GPIO( GPIO_PORTB, 3 ), PINMUX_PB03D_SERCOM5_PAD1 );
toggle();

    me m;
    m.write_read( 0x14, &register_addr, 1, &register_content, 1 );


    for ( ;; )
{
    // gpio_set_pin_level( GPIO( GPIO_PORTB, 2 ), true );
    // gpio_set_pin_level( GPIO( GPIO_PORTB, 3 ), true );
    // gpio_set_pin_level( GPIO( GPIO_PORTB, 2 ), false );
    // gpio_set_pin_level( GPIO( GPIO_PORTB, 3 ), false );

}
        ;
}