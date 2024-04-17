ENTRY(Reset);

INCLUDE memory.x

/* stolen from https://github.com/esp-rs/xtensa-lx */
SECTIONS {
  .text : ALIGN(4)
  {
    _stext = .;
    . = ALIGN (4);
    _text_start = ABSOLUTE(.);
    . = ALIGN (4);
    *(.literal .text .literal.* .text.*)
    _text_end = ABSOLUTE(.);
    _etext = .;
  } > ROTEXT

  .rodata : ALIGN(4)
  {
    _rodata_start = ABSOLUTE(.);
    . = ALIGN (4);
    *(.rodata .rodata.*)
    _rodata_end = ABSOLUTE(.);
  } > RODATA

  .data : ALIGN(4)
  {
    _data_start = ABSOLUTE(.);
    . = ALIGN (4);
    *(.data .data.*)
    _data_end = ABSOLUTE(.);
  } > RWDATA AT > RODATA

  /* LMA of .data */
  _sidata = LOADADDR(.data);

  .bss (NOLOAD) : ALIGN(4)
  {
    _bss_start = ABSOLUTE(.);
    . = ALIGN (4);
    *(.bss .bss.* COMMON)
    _bss_end = ABSOLUTE(.);
  } > RWDATA

  .noinit (NOLOAD) : ALIGN(4)
  {
    . = ALIGN(4);
    *(.noinit .noinit.*)
  } > RWDATA

  .rwtext : ALIGN(4)
  {
    . = ALIGN (4);
    *(.rwtext.literal .rwtext .rwtext.literal.* .rwtext.*)
  } > RWTEXT

 /* must be last segment using RWTEXT */
  .text_heap_start (NOLOAD) : ALIGN(4)
  {
    . = ALIGN (4);
    _text_heap_start = ABSOLUTE(.);
  } > RWTEXT

 /* must be last segment using RWDATA */
  .heap_start (NOLOAD) : ALIGN(4)
  {
    . = ALIGN (4);
    _heap_start = ABSOLUTE(.);
  } > RWDATA
}
