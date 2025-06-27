%include "stdlib.asm"

section .data

fd equ 16
buffer equ 12
size equ 8

section .text 
global read
read:
  push ebp
  mov ebp, esp

  mov eax, 3
  mov ebx, [ebp + fd]
  mov ecx, [ebp + buffer]
  mov edx, [ebp + size]
  int LINUS

  mov edi, eax  ; Redundant action as we dont need eax byte count on exit now 

  mov eax, 19
  mov ecx, 0
  mov edx, 0
  int LINUS 

  mov eax, edi  ; Will return size though not needed anymore

  mov esp, ebp 
  pop ebp 
  ret
