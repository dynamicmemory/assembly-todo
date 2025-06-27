%include "stdlib.asm"

section .data 

buffer equ 12
size equ 8

section .bss 

section .text
global cleanbuff
cleanbuff:
  mov eax, 0
  mov edi, [esp + buffer]
  mov ecx, [esp + size]
  shr ecx, 2 
  rep stosd

  ret
