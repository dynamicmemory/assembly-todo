%include "stdlib.asm"

section .data

question db "(a) - add | (d) - delete | (e) - exit", 0x0A, 0 
size equ 39

section .bss 

question_buffer resb size 
input_buffer resb 1

section .text 
global command
extern read 
extern write
command:
  push ebp
  mov ebp, esp

  ; write question to stdout
  push 1 
  push question 
  push size
  call write 
  add esp, 12 
 
  ; read in user input
  push 0 
  push input_buffer
  push 4
  call read 
  add esp, 12

  mov eax, [input_buffer] 

  mov esp, ebp
  pop ebp
  ret
