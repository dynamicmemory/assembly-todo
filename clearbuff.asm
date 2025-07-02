%include "stdlib.asm"

section .data 

buffer equ 12
size equ 8

section .bss 

section .text
global cleanbuff
cleanbuff:
  push ebp 
  mov ebp, esp 
  mov eax, 0
  mov edi, [ebp + buffer]
  mov ecx, [ebp + size]
  shr ecx, 2 
  rep stosd

  mov esp, ebp
  pop ebp
  ret
