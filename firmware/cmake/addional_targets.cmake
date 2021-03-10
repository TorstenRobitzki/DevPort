function(additional_targets TARGETNAME)
    add_custom_target(${TARGETNAME}.hex
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.elf
    )

    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.hex
        DEPENDS ${TARGETNAME}.elf
        COMMAND arm-none-eabi-objcopy -S -O ihex ${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.elf ${CMAKE_CURRENT_BINARY_DIR}/${TARGETNAME}.hex
    )

    add_custom_target(${TARGETNAME}.lis
        arm-none-eabi-objdump -S ${TARGETNAME}.elf > ${TARGETNAME}.lis
        )

    add_dependencies(${TARGETNAME}.lis ${TARGETNAME}.elf)

    set_target_properties(${TARGETNAME}.elf PROPERTIES
        LINK_FLAGS "-T ${CMAKE_CURRENT_SOURCE_DIR}/samd51j19a_flash.ld -Wl,-Map -Wl,${TARGETNAME}.map")

endfunction()
