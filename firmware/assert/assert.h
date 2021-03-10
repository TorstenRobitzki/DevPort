#ifndef SOURCE_ASSERT_ASSERT_H
#define SOURCE_ASSERT_ASSERT_H

#include <cstdint>

#undef assert

#ifdef NDEBUG           /* required by ANSI standard */
#   define assert(__e) ((void)0)
#else
#   define assert(__e) ((__e) ? (void)0 : __assert_stop_func())

#endif /* !NDEBUG */

extern "C" void __assert_stop_func() __attribute__((__noreturn__));

#endif
