#include <sam.h>
#include <hal_gpio.h>
#include <hal_init.h>


#include "drivers/layout.hpp"

#define CONF_XOSC0_FREQUENCY 12000000
#define CONF_XOSC0_XTALEN 1
#define CONF_XOSC0_RUNSTDBY 0
#define CONF_XOSC0_ONDEMAND 0
#define CONF_XOSC0_LOWBUFGAIN 1
#define CONF_XOSC0_ENALC 1
#define CONF_XOSC0_CFDEN 1
#define CONF_XOSC0_SWBEN 0
#define CONF_XOSC0_STARTUP 0
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
}

extern "C" void main_entry()
{
    init_mcu();
    setup_main_clock();

    gpio_set_pin_direction( test0_pin, GPIO_DIRECTION_OUT );

    gpio_set_pin_level( test0_pin, false );

    for ( ;; )
    {
    gpio_set_pin_level( test0_pin, false );

        for ( volatile int i = 0; i != 600000; ++i )
            ;
    gpio_set_pin_level( test0_pin, true );

        for ( volatile int i = 0; i != 600000; ++i )
            ;
    }
}