extern "C" void __assert_stop_func()
{
    __asm__("BKPT");
    for ( ;; )
        ;
}
