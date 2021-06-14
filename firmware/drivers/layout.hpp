#ifndef FIRMWARE_DRIVERS_LAYOUT_HPP
#define FIRMWARE_DRIVERS_LAYOUT_HPP

#include <hpl_gpio.h>

#include <cstdint>

static constexpr std::uint8_t  test0_pin = GPIO( GPIO_PORTB, 23 );

static constexpr std::uint32_t external_osc_frequency = 12000000;
static constexpr std::uint8_t  external_osc_index = 0;

#endif
