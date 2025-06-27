%include "stdlib.asm"

section .data 

fd equ 16
buffer equ 12 
size equ 8

section .text 
global write
write:
    push ebp
    mov ebp, esp 

    mov eax, 4
    mov ebx, [ebp + fd]
    mov ecx, [ebp + buffer]
    mov edx, [ebp + size]
    int LINUS

    mov esp, ebp 
    pop ebp 
    ret 
