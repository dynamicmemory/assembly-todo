%include "stdlib.asm"

section .data

fd equ 12
question db "What would you like to add to the list?", 0x0A, 0 
q_size equ 40

section .bss 

answer_buffer resb BUFFERSIZ

section .text 
extern read
extern write
extern clearscreen
global add 
add:
  push ebp
  mov ebp, esp 

  ;write question to out 
  push 1
  push question 
  push q_size
  call write
  add esp, 12 

  ;get answert in buffer 
  push 0
  push answer_buffer 
  push BUFFERSIZ 
  call read 
  add esp, 12

  ;check for \n termination
  mov ecx, eax 
  dec ecx 
  cmp byte [answer_buffer + ecx], 0x0A
  je done

  mov byte [answer_buffer + ecx], 0x0A 
  inc eax 

  done:

  ;write to file
  push dword [ebp + fd] 
  push answer_buffer 
  push eax 
  call write 
  add esp, 12

  ; Move the fp back to the start of the file 
  mov eax, 19
  mov ebx, [ebp + fd]
  mov ecx, $0
  mov edx, $0 
  int LINUS 
  
  mov esp, ebp 
  pop ebp 
  ret
