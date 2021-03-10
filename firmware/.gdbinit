# to renamed to .gdbinit
# to disable optimization for a single function: __attribute__((optimize("O0")))
# > layout asm
# > info registers
# set print pretty on
# set debug remote 1
# set remotetimeout 120
# __asm__("BKPT");

target remote localhost:2331
monitor speed 1000
monitor flash breakpoints = 1
monitor flash download = 1
monitor flash device = atsamd51j19
monitor reset

symbol /Users/todi/DevPort/firmware/build/led_test.elf
load /Users/todi/DevPort/firmware/build/led_test.elf

