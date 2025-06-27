%include "stdlib.asm"

section .data

nline db 0x0A

section .text
global newline
newline:
  mov eax, 4
  mov ebx, 1
  mov ecx, nline
  mov edx, 1
  int LINUS 

  ret

