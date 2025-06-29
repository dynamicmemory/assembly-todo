%include "stdlib.asm"
section .data 

fname equ 8

section .bss

stats resb 144

section .text 
global fsize
fsize:
  push ebp
  mov ebp, esp

  mov eax, 106
  mov ebx, [ebp + fname]
  mov ecx, stats
  mov edx, 144 
  int LINUS 
  
  mov eax, [stats+24]
  mov esp, ebp 
  pop ebp
  ret 


