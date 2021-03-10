#ifndef FIRMWARE_DRIVERS_ERROR_HANDLER_HPP
#define FIRMWARE_DRIVERS_ERROR_HANDLER_HPP

#include <cstdint>
#include <cassert>

static inline void error_handler( std::uint32_t rc )
{
    static_cast< void >( rc );
    assert( rc == 0 );
}

#endif
