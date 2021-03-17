#include <sam.h>
#include <system_samd51.h>
#include <hal_gpio.h>
#include <hal_init.h>
#include <parts.h>

#include "drivers/error_handler.hpp"
#include "drivers/async_i2c.hpp"
#include "drivers/timer.hpp"

#include "port_hubs.hpp"
#include "port_hubs.impl"

#include <iterator>

static void toggle()
{
    gpio_set_pin_level( GPIO( GPIO_PORTA, 16 ), true );
    gpio_set_pin_level( GPIO( GPIO_PORTA, 16 ), false );
}

extern "C" void main_entry()
{
    SystemInit();
    init_mcu();

    gpio_set_pin_direction( GPIO( GPIO_PORTA, 16 ), GPIO_DIRECTION_OUT );
    toggle();

    gpio_set_pin_function( GPIO( GPIO_PORTB, 2 ), PINMUX_PB02D_SERCOM5_PAD0 );
    gpio_set_pin_function( GPIO( GPIO_PORTB, 3 ), PINMUX_PB03D_SERCOM5_PAD1 );

toggle();
    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM5_GCLK_ID_CORE, GCLK_PCHCTRL_GEN_GCLK0_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));
    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM5_GCLK_ID_SLOW, GCLK_PCHCTRL_GEN_GCLK3_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));
    hri_mclk_set_APBDMASK_SERCOM5_bit(MCLK);

    hri_gclk_write_PCHCTRL_reg(GCLK, TC0_GCLK_ID, GCLK_PCHCTRL_GEN_GCLK0_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));
    hri_mclk_set_APBAMASK_TC0_bit(MCLK);

toggle();
toggle();

toggle();

    port_hubs<
        async_i2c_instance< 0x43000400UL >::type,
        timer_instance< 0x40003800UL >::type > hubs;

    hubs.port_led( 2, port_color::red, port_blink_pattern::blink );
    hubs.port_led( 0, port_color::green, port_blink_pattern::blink );
    hubs.port_led( 3, port_color::blue, port_blink_pattern::blink );

    for ( ;; )
        hubs.handle_events();

}

extern "C" void NonMaskableInt_Handler()
{
    assert( false );
}

extern "C" void HardFault_Handler()
{
    assert( false );
}

extern "C" void MemManagement_Handler()
{
    assert( false );
}

extern "C" void BusFault_Handler()
{
    assert( false );
}

extern "C" void UsageFault_Handler()
{
    assert( false );
}
