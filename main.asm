 ; TODO read
 ; TODO write 
 ; TODO clear buffer  
 ; TODO newline 
 ; TODO clean screen
 ; TODO append
 ; TODO writestdout
 ; TODO windpointerback 

%include "stdlib.asm"

section .data

section .bss 
file_buffer resb BUFFERSIZ 
stats resb 144

section .text
global _start
extern open
extern fsize
_start:
  push ebp
  mov ebp, esp
  sub esp, 8
  
  call open ; Open the file 
 
  mov dword [ebp - 4], eax ; move the fd into the stack
  
  push eax 
  call fsize
  add esp, 4 

  mov dword [ebp - 8], eax ; move the file size into the stack 

  mov edx, eax 
  mov eax, 3
  mov ebx, [ebp-4]
  mov ecx, file_buffer
  int LINUS

  mov eax, 4
  mov ebx, 1
  mov ecx, file_buffer 
  mov edx, [ebp-8]
  int LINUS 

  mov esp, ebp
  pop ebp
  mov eax, 1
  xor ebx, ebx
  int LINUS
