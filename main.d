extern (C):
nothrow:
@nogc:
@system:

import ldc.llvmasm;

// entry point
void Reset()
{
    main();
}

noreturn main()
{
    while (true)
    {
        __asm("nop", "");
    }
}
