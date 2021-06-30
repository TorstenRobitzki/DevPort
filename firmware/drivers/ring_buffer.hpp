#ifndef BLE_JTAG_SOURCE_FIRMWARE_RING_BUFFER_HPP
#define BLE_JTAG_SOURCE_FIRMWARE_RING_BUFFER_HPP

#include <cstdint>
#include <cstdlib>
#include <utility>
#include <cassert>
#include <iterator>
#include <algorithm>
#include <atomic>

/**
 * @brief ring buffer that allows to communicate between the main thread and an interrupt service routine.
 *
 * The ringer buffer used two volatile pointers for bookkeeping. Every operation will at most modify one
 * of the pointers.
 */
template < std::size_t MaxSize, typename EleType = std::uint8_t >
class ring_buffer
{
public:
    ring_buffer();

    /**
     * @brief put up to size elements into the buffer.
     *
     * @return the number of elements that where added to the buffer.
     */
    std::size_t put( const EleType* data, std::size_t size );

    /**
     * @brief returns the total number of elements that could be written to
     *        the buffer, using put().
     */
    std::size_t put_size() const;

    /**
     * @brief returns a continues memory location, that a client can use to
     *        write to.
     *
     * @note the size of this area can be less than put_size(). To fill the buffer
     *       completly, call put_area()/advance_put_area(), until put_area().first == 0.
     *
     * @sa advance_put_area()
     */
    std::pair< std::size_t, EleType* > put_area();

    /**
     * @brief after a client wrote size elements to the put_area(), this
     *        function can be used to mark the filled part of the buffer as filled.
     *
     * @pre size <= put_area().first
     */
    void advance_put_area( std::size_t size );

    /**
     * @brief retrieve up to size elements from the buffer.
     *
     * @return the number of elements that where retrieved from the buffer and copied to data.
     */
    std::size_t get( EleType* data, std::size_t size );

    /**
     * @brief returns the total number of elements that are in the buffer, ready to be read.
     */
    std::size_t get_size() const;

    /**
     * @brief returns a continues memory location, that a client can use to
     *        read from the buffer.
     *
     * @note the size of this area can be less than get_size(). To read the buffer
     *       completly, call get_area()/advance_get_area(), until get_area().first == 0.
     *
     * @sa advance_get_area()
     */
    std::pair< std::size_t, const EleType* > get_area() const;

    /**
     * @brief after a client read size elements from the get_area(), this
     *        function can be used to remove the elements read.
     */
    void advance_get_area( std::size_t size );

    /**
     * @brief removes all elements from the buffer and resets all pointers
     *
     * @post get_size() == 0
     */
    void clear();

    static constexpr std::size_t max_size = MaxSize;

private:
    // Empty is encoded with put_ == get_
    // put_ and get_ will never be std::end( buffer_ )
    std::atomic< EleType* > put_;
    std::atomic< EleType* > get_;

    // one element more, to allow having different get_ and put_ values, when the buffer is full
    EleType             buffer_[ MaxSize + 1 ];
};


// implementation
template < std::size_t MaxSize, typename EleType >
ring_buffer< MaxSize, EleType >::ring_buffer()
    : put_( std::begin( buffer_ ) )
    , get_( std::begin( buffer_ ) )
{
}

template < std::size_t MaxSize, typename EleType >
std::size_t ring_buffer< MaxSize, EleType >::put( const EleType* data, std::size_t size )
{
    std::size_t result = 0;

    for ( auto area = put_area(); area.first && size; area = put_area() )
    {
        const std::size_t copy_size = std::min( area.first, size );

        std::copy( data, data + copy_size, area.second );
        advance_put_area( copy_size );

        result += copy_size;
        data   += copy_size;
        size   -= copy_size;
    }

    return result;
}

template < std::size_t MaxSize, typename EleType >
std::size_t ring_buffer< MaxSize, EleType >::put_size() const
{
    return MaxSize - get_size();
}

template < std::size_t MaxSize, typename EleType >
std::pair< std::size_t, EleType* > ring_buffer< MaxSize, EleType >::put_area()
{
    const auto p = put_.load();
    const auto g = get_.load();

    return p < g
        ? std::pair< std::size_t, EleType* >( g - p - 1, p )
        : g == std::begin( buffer_ )
            ? std::pair< std::size_t, EleType* >( std::end( buffer_ ) - p - 1, p )
            : std::pair< std::size_t, EleType* >( std::end( buffer_ ) - p, p );
}

template < std::size_t MaxSize, typename EleType >
void ring_buffer< MaxSize, EleType >::advance_put_area( std::size_t size )
{
    auto p = put_.load();

    p += size;

    if ( p == std::end( buffer_ ) )
        p = std::begin( buffer_ );

    put_.store( p );
}

template < std::size_t MaxSize, typename EleType >
std::size_t ring_buffer< MaxSize, EleType >::get( EleType* data, std::size_t size )
{
    std::size_t result = 0;

    for ( auto area = get_area(); area.first && size; area = get_area() )
    {
        const std::size_t copy_size = std::min( area.first, size );

        std::copy( area.second, area.second + copy_size, data );
        advance_get_area( copy_size );

        result += copy_size;
        data   += copy_size;
        size   -= copy_size;
    }

    return result;
}

template < std::size_t MaxSize, typename EleType >
std::size_t ring_buffer< MaxSize, EleType >::get_size() const
{
    const auto g = get_.load();
    const auto p = put_.load();

    if ( g == p )
        return 0;

    return g < p
        ? p - g
        : std::end( buffer_ ) - g + p - std::begin( buffer_ );
}

template < std::size_t MaxSize, typename EleType >
std::pair< std::size_t, const EleType* > ring_buffer< MaxSize, EleType >::get_area() const
{
    const EleType* p = put_.load();
    const EleType* g = get_.load();

    return g <= p
        ? std::pair< std::size_t, const EleType* >( p - g, g )
        : std::pair< std::size_t, const EleType* >( std::end( buffer_ ) - g, g );
}

template < std::size_t MaxSize, typename EleType >
void ring_buffer< MaxSize, EleType >::advance_get_area( std::size_t size )
{
    EleType* g = get_.load();

    g += size;

    if ( g == std::end( buffer_ ) )
        g = std::begin( buffer_ );

    get_.store( g );
}

template < std::size_t MaxSize, typename EleType >
void ring_buffer< MaxSize, EleType >::clear()
{
    put_.store( std::begin( buffer_ ) );
    get_.store( std::begin( buffer_ ) );
}

#endif
