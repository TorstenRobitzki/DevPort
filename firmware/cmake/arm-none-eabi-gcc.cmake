# arm-none-eabi cannot create executable test on x86, so try static library instead
SET(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")

# Indicate we aren't compiling for an OS
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

# Toolchain path
set(COMPILER_PREFIX /usr/local/gcc-arm-none-eabi-8-2019-q3-update/bin/)

# Set C and C++ compilers
set(CMAKE_C_COMPILER ${COMPILER_PREFIX}arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER ${COMPILER_PREFIX}arm-none-eabi-g++)

set(CMAKE_AR ${COMPILER_PREFIX}arm-none-eabi-gcc-ar CACHE FILEPATH "Archiver" FORCE)
set(CMAKE_RANLIB ${COMPILER_PREFIX}arm-none-eabi-gcc-ranlib CACHE FILEPATH "Ranlib" FORCE)

# Set other tools
set(OBJSIZE ${COMPILER_PREFIX}arm-none-eabi-size)
set(OBJCOPY ${COMPILER_PREFIX}arm-none-eabi-objcopy)
set(OBJDUMP ${COMPILER_PREFIX}arm-none-eabi-objdump)
set(DEBUGGER ${COMPILER_PREFIX}arm-none-eabi-gdb)

# Set library options
set(SHARED_LIBS OFF)
set(STATIC_LIBS ON)