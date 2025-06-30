%include "stdlib.asm"

section .data 

question db "Which line would you like to delete?", 0x0A, 0
qsize equ $ - question  

fd equ 12 
size equ 8 

section .bss 

file_buffer resb BUFFERSIZ
input_buffer resb 5

section .text
extern write 
extern read 
extern open 
global delete
delete:
  push ebp 
  mov ebp, esp 

  ; Ask which line to delete 
  push 1 
  push question
  push qsize 
  call write
  add esp, 12 
  
  ; Read answer in
  push 0 
  push input_buffer 
  push 5 
  call read 
  add esp, 12 

  ; convert answer to digit 
  xor edi, edi 
  mov eax, [input_buffer]
  convert_digit: 
    mov cl, [eax] 
    cmp cl, 0x0A
    je converted 
 
    sub cl, '0'  
    movzx ecx, cl  
    imul edi, edi, 10 
    add edi, ecx 

    inc eax 
    jmp convert_digit
 
  converted:

  ; Read file into buffer 
  push dword [ebp + fd]
  push file_buffer
  push BUFFERSIZ
  call read 
  add esp, 12 

  cmp edi, 44 
  je num_test 

  end:
    mov esp, ebp 
    pop ebp 
    ret 

  num_test:

  push 1
  push file_buffer
  push eax 
  call write 
  add esp, 12 

  ; repeating for debugging to stop the clear from clearing the output
  push 0 
  push input_buffer 
  push 5 
  call read 
  add esp, 12 

  jmp end 
