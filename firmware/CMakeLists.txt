cmake_minimum_required(VERSION 3.18)

project(led_test VERSION 0.1.0 LANGUAGES C CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(addional_targets)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_C_STANDARD 11)

# default flags
set(CXX_DEFAULT_FLAGS "-std=c++2a -Wall -Wpedantic -Wextra -Werror -Wfatal-errors")
set(C_DEFAULT_FLAGS "-std=c11 -Wall -Wextra -Werror -Wfatal-errors")

set(ARM_FLAGS "-mthumb -mabi=aapcs -mcpu=cortex-m4")
set(ARM_FLAGS "${ARM_FLAGS} -ffunction-sections -fdata-sections")

set(CXX_ARC_FLAGS "${ARM_FLAGS} -mfloat-abi=hard -mfpu=fpv4-sp-d16")
set(LINK_ARC_FLAGS "${ARM_FLAGS} --specs=nosys.specs  -static -lstdc++ -lsupc++ ")

set(CXX_SPECIFIC_FLAGS "${CXX_SPECIFIC_FLAGS} -ftemplate-backtrace-limit=0 -fvisibility-inlines-hidden -fno-rtti -fno-exceptions -fno-threadsafe-statics")
set(LINK_DEFAULT_FLAGS "${LINK_DEFAULT_FLAGS} -Wl,--gc-sections -nostartfiles -Wl,--entry -Wl,exception_table ")

set(CXX_BUILD_TYPE_FLAGS "-g")
set(LINK_BUILD_TYPE_FLAGS "-g")

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CXX_BUILD_TYPE_FLAGS "${CXX_BUILD_TYPE_FLAGS} -O0")
    add_definitions(-DDEBUG=1)
else()
    set(CXX_BUILD_TYPE_FLAGS "${CXX_BUILD_TYPE_FLAGS} -Os")
    add_definitions(-DNDEBUG)
endif()

set(CMAKE_CXX_FLAGS "${CXX_DEFAULT_FLAGS} ${CXX_SPECIFIC_FLAGS} ${CXX_ARC_FLAGS} ${CXX_BUILD_TYPE_FLAGS} ${CXX_DISABLED_WARNINGS}")
set(CMAKE_C_FLAGS   "${C_DEFAULT_FLAGS} ${C_SPECIFIC_FLAGS} ${CXX_ARC_FLAGS} ${CXX_BUILD_TYPE_FLAGS} ${CXX_DISABLED_WARNINGS}")
set(CMAKE_EXE_LINKER_FLAGS "${LINK_DEFAULT_FLAGS} ${LINK_ARC_FLAGS} ${LINK_BUILD_TYPE_FLAGS} -L ${CMAKE_SOURCE_DIR}")

set(ASF_ROOT ${CMAKE_CURRENT_LIST_DIR}/../asf)

add_library(startup_file STATIC
    runtime.cpp)

target_compile_definitions(startup_file
    PUBLIC
        __SAMD51J19A__)

target_include_directories(startup_file
    PUBLIC
        ${ASF_ROOT}/samd51a/include
        ${ASF_ROOT}/CMSIS/Core/Include
)

add_executable(firmware.elf main.cpp)
target_link_libraries(firmware.elf PRIVATE startup_file drivers)
additional_targets(firmware)

add_executable(led_test.elf led_test.cpp)

target_link_libraries(led_test.elf PRIVATE startup_file drivers)
additional_targets(led_test)

add_subdirectory(drivers)
add_subdirectory(assert)