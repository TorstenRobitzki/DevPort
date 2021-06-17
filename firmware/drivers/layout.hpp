#ifndef FIRMWARE_DRIVERS_LAYOUT_HPP
#define FIRMWARE_DRIVERS_LAYOUT_HPP

#include <hpl_gpio.h>

#include <cstdint>

static constexpr std::uint8_t  test0_pin = GPIO( GPIO_PORTB, 23 );

static constexpr std::uint32_t external_osc_frequency = 12000000;
static constexpr std::uint8_t  external_osc_index = 0;

static constexpr std::uint8_t  hub_reset_local_pin = GPIO( GPIO_PORTB, 17 );
static constexpr std::uint8_t  hs_up_pin = GPIO( GPIO_PORTA, 2 );
static constexpr std::uint8_t  ss_up_pin = GPIO( GPIO_PORTA, 7 );

#endif
