add_library(drivers STATIC
    usb_cdc.cpp
    async_i2c.cpp
    timer.cpp
)

target_sources(drivers
    PRIVATE
        ${ASF_ROOT}/hpl/core/hpl_init.c
        ${ASF_ROOT}/hpl/osc32kctrl/hpl_osc32kctrl.c
        ${ASF_ROOT}/hpl/oscctrl/hpl_oscctrl.c
        ${ASF_ROOT}/hpl/mclk/hpl_mclk.c
        ${ASF_ROOT}/hpl/gclk/hpl_gclk.c
        ${ASF_ROOT}/usb/class/cdc/device/cdcdf_acm.c
        ${ASF_ROOT}/usb/usb_protocol.c
        ${ASF_ROOT}/hal/src/hal_usb_device.c
        ${ASF_ROOT}/hal/src/hal_atomic.c
        ${ASF_ROOT}/usb/device/usbdc.c
        ${ASF_ROOT}/hpl/usb/hpl_usb.c
        ${ASF_ROOT}/hal/utils/src/utils_list.c
)

set_source_files_properties(
    ${ASF_ROOT}/hpl/gclk/hpl_gclk.c
    PROPERTIES COMPILE_FLAGS -Wno-unused-parameter)

set_source_files_properties(
    ${ASF_ROOT}/hal/src/hal_usb_device.c
    ${ASF_ROOT}/hpl/usb/hpl_usb.c
    PROPERTIES COMPILE_FLAGS -Wno-cast-function-type)

target_compile_options(drivers
    PUBLIC
        -D__SAMD51J19A__
        -DUSE_SIMPLE_ASSERT
        -DCONF_XOSC1_ENABLE=0
        -DCONF_XOSC1_CONFIG=0
        -DCONF_GCLK_GENERATOR_0_CONFIG=0
        -DCONF_SERCOM_5_I2CM_ENABLE=1
)

target_link_libraries(drivers PUBLIC assert)

target_include_directories(drivers
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${CMAKE_CURRENT_SOURCE_DIR}/..
        ${ASF_ROOT}/config
        ${ASF_ROOT}/samd51a/include
        ${ASF_ROOT}/hal/include
        ${ASF_ROOT}/hal/utils/include
        ${ASF_ROOT}/hpl/port
        ${ASF_ROOT}/hpl/gclk
        ${ASF_ROOT}/CMSIS/Core/include
        ${ASF_ROOT}/hri
        ${ASF_ROOT}/usb/class/cdc/device
        ${ASF_ROOT}/usb/class/cdc
        ${ASF_ROOT}/usb/device
        ${ASF_ROOT}/usb
)