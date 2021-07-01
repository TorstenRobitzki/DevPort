#include <sam.h>
#include <hal_gpio.h>
#include <hal_init.h>
#include <hal_delay.h>

#include "temperature.hpp"
#include "usb_hub.hpp"

#include "drivers/layout.hpp"
#include "drivers/async_i2c.hpp"
#include "drivers/usb_hub_gpios.hpp"
#include "drivers/usb_cdc.hpp"

#define CONF_XOSC0_FREQUENCY 12000000
#define CONF_XOSC0_XTALEN 1
#define CONF_XOSC0_RUNSTDBY 0
#define CONF_XOSC0_ONDEMAND 0
#define CONF_XOSC0_LOWBUFGAIN 1
#define CONF_XOSC0_ENALC 1
#define CONF_XOSC0_CFDEN 1
#define CONF_XOSC0_SWBEN 0
#define CONF_XOSC0_STARTUP 5
#define CONF_XOSC0_ENABLE 1
#define CONF_XOSC0_CONFIG 1

#if CONF_XOSC0_FREQUENCY >= 32000000
#define CONF_XOSC0_CFDPRESC 0x0
#define CONF_XOSC0_IMULT 0x7
#define CONF_XOSC0_IPTAT 0x3
#elif CONF_XOSC0_FREQUENCY >= 24000000
#define CONF_XOSC0_CFDPRESC 0x1
#define CONF_XOSC0_IMULT 0x6
#define CONF_XOSC0_IPTAT 0x3
#elif CONF_XOSC0_FREQUENCY >= 16000000
#define CONF_XOSC0_CFDPRESC 0x2
#define CONF_XOSC0_IMULT 0x5
#define CONF_XOSC0_IPTAT 0x3
#elif CONF_XOSC0_FREQUENCY >= 8000000
#define CONF_XOSC0_CFDPRESC 0x3
#define CONF_XOSC0_IMULT 0x4
#define CONF_XOSC0_IPTAT 0x3
#endif

static void setup_main_clock()
{
    /*
     * GCLK0: CPU 120 MHz
     * GCLK1: PPL48 input 12MHz / 2^9
     * GCLK2: USB 48 MHz
     */

    // enable external oscilator
    hri_oscctrl_write_XOSCCTRL_reg(
        OSCCTRL,
        external_osc_index,
        OSCCTRL_XOSCCTRL_CFDPRESC(CONF_XOSC0_CFDPRESC) | OSCCTRL_XOSCCTRL_STARTUP(CONF_XOSC0_STARTUP)
            | (CONF_XOSC0_SWBEN << OSCCTRL_XOSCCTRL_SWBEN_Pos) | (CONF_XOSC0_CFDEN << OSCCTRL_XOSCCTRL_CFDEN_Pos)
            | (0 << OSCCTRL_XOSCCTRL_ENALC_Pos) | OSCCTRL_XOSCCTRL_IMULT(CONF_XOSC0_IMULT)
            | OSCCTRL_XOSCCTRL_IPTAT(CONF_XOSC0_IPTAT) | (CONF_XOSC0_LOWBUFGAIN << OSCCTRL_XOSCCTRL_LOWBUFGAIN_Pos)
            | (0 << OSCCTRL_XOSCCTRL_ONDEMAND_Pos) | (CONF_XOSC0_RUNSTDBY << OSCCTRL_XOSCCTRL_RUNSTDBY_Pos)
            | (CONF_XOSC0_XTALEN << OSCCTRL_XOSCCTRL_XTALEN_Pos) | (CONF_XOSC0_ENABLE << OSCCTRL_XOSCCTRL_ENABLE_Pos));

    while ( !hri_oscctrl_get_STATUS_XOSCRDY0_bit( OSCCTRL ) )
        ;

    // setup PPL to generate 120MHz
    // predevide the input down to 3MHz to conform to the maximum frequency requirement
    // fdiv = fosc / 2 * (div + 1) => div = fosc / 2 * fdiv - 1 = 1
    OscctrlDpll* const pll = &OSCCTRL->Dpll[ 0 ];

    hri_oscctrldpll_write_DPLLCTRLB_reg( pll,
        OSCCTRL_DPLLCTRLB_REFCLK_XOSC0
      | OSCCTRL_DPLLCTRLB_DIV( 1 ));

    // f = fdiv * (LDR + 1 + LDRFRAC / 32) = 3MHz * ( 39 + 1 + 0 / 32 ) = 120 MHz
    hri_oscctrldpll_write_DPLLRATIO_reg( pll,
        OSCCTRL_DPLLRATIO_LDR( 39 )
      | OSCCTRL_DPLLRATIO_LDRFRAC( 0 ) );

    hri_oscctrldpll_set_DPLLCTRLA_ENABLE_bit( pll );

    // set GCLK_MAIN to 120 MHz
    hri_gclk_write_GENCTRL_reg( GCLK, 0,
        GCLK_GENCTRL_SRC_DPLL0
      | GCLK_GENCTRL_GENEN );

    // set GCLK 1 to PLL48 reference to 12MHz / 512
    hri_gclk_write_GENCTRL_reg( GCLK, 1,
        GCLK_GENCTRL_SRC_XOSC0
      | GCLK_GENCTRL_DIV( 9 - 1 )
      | GCLK_GENCTRL_DIVSEL
      | GCLK_GENCTRL_GENEN );

    // Configure DFLL48
    hri_oscctrl_clear_DFLLCTRLA_ENABLE_bit( OSCCTRL );

    while ( hri_oscctrl_get_DFLLSYNC_ENABLE_bit( OSCCTRL ) )
        ;

    hri_oscctrl_set_DFLLCTRLA_ENABLE_bit( OSCCTRL );

    while ( hri_oscctrl_get_DFLLSYNC_ENABLE_bit( OSCCTRL ) )
        ;

    /*
     * Closed-Loop Operation
    * In closed-loop operation, the output frequency is continuously regulated against a reference clock.
    * Once the multiplication factor is set, the oscillator fine tuning is automatically adjusted. The DFLL48M
    * must be correctly configured before closed-loop operation can be enabled. After enabling the DFLL48M,
    * it must be configured in the following way:
    *
    * 1. The output of Peripheral Channel 0 provides the input reference clock to DFLL48M (GCLK_DFLL48M_REF).
    *    Set GCLK.PCHCTRL0.GEN = 0 to select Generic Clock Channel 0 output as the input to this peripheral channel.
    *    Select the clock input to GCLK0 via GCLK.GENCTRL0.SRC
    * 2. Select the maximum step size allowed in finding the Coarse and Fine values by writing the appropriate values
    *    to the DFLL Coarse Maximum Step and DFLL Fine Maximum Step bit groups (DFLLMUL.CSTEP and DFLLMUL. FSTEP)
    *    in the DFLL Multiplier register. A small step size will ensure low overshoot on the output frequency,
    *    but will typically result in longer lock times. A high value might give a large overshoot, but will typically
    *    provide faster locking. DFLLMUL.CSTEP and DFLLMUL.FSTEP should not be higher than 50% of the maximum value of DFLLVAL.
    *    COARSE and DFLLVAL.FINE, respectively.
    * 3. Select the multiplication factor in the DFLL Multiply Factor bit group (DFLLMUL.MUL) in the DFLL Multiplier register.
    *    Care must be taken when choosing DFLLMUL.MUL so that the output frequency does not exceed the maximum
    *    frequency of the device.
    * 4. Start the closed loop mode by writing a one to the DFLL Mode Selection bit (DFLLCTRLA.MODE) in the DFLL Control register.
    */

    // 1. the reference frequency for the 48Mhz PLL is (GCLK_DFLL48M_REF) is 12MHz / 512 and is passed to the PLL by peripheral channel 0
    hri_gclk_write_PCHCTRL_reg( GCLK, 0, GCLK_PCHCTRL_GEN_GCLK1 | GCLK_PCHCTRL_CHEN );

    // 2.
    hri_oscctrl_write_DFLLMUL_reg( OSCCTRL,
        OSCCTRL_DFLLMUL_CSTEP(1)
      | OSCCTRL_DFLLMUL_FSTEP(1) );

    // 3.
    hri_oscctrl_set_DFLLMUL_MUL_bf( OSCCTRL, 48 / 12 * 512 );

    while ( hri_oscctrl_get_DFLLSYNC_DFLLMUL_bit( OSCCTRL ) )
        ;

    // 4. set PLL to close loop
    hri_oscctrl_set_DFLLCTRLB_MODE_bit( OSCCTRL );

    while ( hri_oscctrl_get_DFLLSYNC_DFLLCTRLB_bit( OSCCTRL ) )
        ;

    while ( hri_oscctrl_get_STATUS_reg( OSCCTRL, OSCCTRL_STATUS_DFLLRDY | OSCCTRL_STATUS_DFLLLCKC ) != ( OSCCTRL_STATUS_DFLLRDY | OSCCTRL_STATUS_DFLLLCKC ) )
        ;

    // set GLOCK 2 as GCLK_USB to 48 MHz
    hri_gclk_write_GENCTRL_reg( GCLK, 2,
        GCLK_GENCTRL_SRC_DFLL
      | GCLK_GENCTRL_GENEN );

}

static void setup_sercom1()
{
    gpio_set_pin_function( GPIO( GPIO_PORTA, 0 ), PINMUX_PA00D_SERCOM1_PAD0 );
    gpio_set_pin_function( GPIO( GPIO_PORTA, 1 ), PINMUX_PA01D_SERCOM1_PAD1 );

    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM1_GCLK_ID_CORE, GCLK_PCHCTRL_GEN_GCLK0 | GCLK_PCHCTRL_CHEN );
//    hri_gclk_write_PCHCTRL_reg(GCLK, SERCOM1_GCLK_ID_SLOW, GCLK_PCHCTRL_GEN_GCLK3_Val | (1 << GCLK_PCHCTRL_CHEN_Pos));

    hri_mclk_set_APBAMASK_SERCOM1_bit( MCLK );
}

static void setup_usb()
{
    gpio_set_pin_function( GPIO( GPIO_PORTA, 24 ), PINMUX_PA24H_USB_DM );
    gpio_set_pin_function( GPIO( GPIO_PORTA, 25 ), PINMUX_PA25H_USB_DP );

    hri_gclk_write_PCHCTRL_reg( GCLK, GCLK_PCHCTRL_GEN_GCLK10, GCLK_PCHCTRL_GEN_GCLK2 | GCLK_PCHCTRL_CHEN );
    hri_mclk_set_AHBMASK_USB_bit( MCLK );
    hri_mclk_set_APBBMASK_USB_bit( MCLK );
}

struct init
{
    init()
    {
        init_mcu();

        setup_main_clock();

        delay_init(SysTick);

        setup_sercom1();
        setup_usb();

        gpio_set_pin_direction( test0_pin, GPIO_DIRECTION_OUT );
        gpio_set_pin_level( test0_pin, true );
    }
} init_cpu;

usb_hub< i2c_sercom1, usb_hub_gpios > local_hub;

static std::uint8_t wellcome_message[] =
    "++++++++++++++++++++++++++++++\r\n"
    "+ your USB hub welcomes you! +\r\n"
    "++++++++++++++++++++++++++++++\r\n";

static bool require_read = true;

static std::uint8_t input_buffer[ 1 ];

struct cdc_callbacks : public usb_cdc< cdc_callbacks >
{
    void on_cdc_connected()
    {
        delay_ms( 100 );
        gpio_set_pin_level( test0_pin, false );
        write_usb_cdc( wellcome_message, sizeof( wellcome_message ) );

        if ( require_read )
        {
            require_read = false;
            read_usb_cdc( input_buffer, sizeof( input_buffer ) );
        }
    }

    void on_cdc_disconnect()
    {
        gpio_set_pin_level( test0_pin, true );
    }

    void on_cdc_read( std::size_t size )
    {
        write_usb_cdc( input_buffer, size );
        read_usb_cdc( input_buffer, sizeof( input_buffer ) );
    }

    void on_cdc_write( std::size_t size )
    {
        (void)size;
    }

} cdc;

//temperature< i2c_sercom1 > temp_sensor;

extern "C" void main_entry()
{

//    temp_sensor.start_read_temperature();
    for ( ;; )
    {
        while ( local_hub.handle_events() || cdc.handle_events() )
            ;

        __WFI();
/*        temp_sensor.handle_events();

        if ( temp_sensor.new_temperature().has_value() )
        {
            temp_sensor.start_read_temperature();
        }*/
    }
}