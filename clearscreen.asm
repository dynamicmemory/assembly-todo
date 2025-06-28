%include "stdlib.asm"

section .data

sequence db 0x1B, "c"
; sequence db 0x1B, "[2J", 0x1B, "[H"

section .text 
extern write
global clearscreen 
clearscreen:
  push 1
  push sequence
  push 4
  call write
  add esp, 12

  ret
