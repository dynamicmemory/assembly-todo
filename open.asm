%include "stdlib.asm"
section .data

section .text 
global open
open:
  mov eax, 5
  mov ebx, FNAME
  mov ecx, O_RDWR_C_A
  mov edx, PERMISSIONS
  int LINUS

  ret
