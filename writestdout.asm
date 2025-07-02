%include "stdlib.asm"

section .data 

fd equ 12 
size equ 8 

space db " - ", 0x0A, 0

section .bss 

file_buffer resb BUFFERSIZ 
new_buffer resb BUFFERSIZ 
space_buffer resb 4

section .text 
extern write 
extern read 
extern cleanbuff
global writestdout
writestdout:
  push ebp 
  mov ebp, esp 

  push file_buffer
  push BUFFERSIZ
  call cleanbuff
  add esp, 8 

  push new_buffer
  push BUFFERSIZ
  call cleanbuff
  add esp, 8 

  push dword [ebp + fd]
  push file_buffer
  push BUFFERSIZ
  call read 
  add esp, 12 

    



  mov edi, eax 
  xor eax, eax 
  xor esi, esi
  xor ecx, ecx 
  xor ebx, ebx 

  jmp addnum 

  loop:
    mov eax, [file_buffer + ebx]
    mov [new_buffer + ecx], al

    inc ebx 
    inc ecx 

    cmp ebx, edi
    je writeoutput
    cmp al, 0x0A
    je addnum 

    jmp loop 

  addnum:
    inc esi 
    mov eax, esi 
    cmp eax, 10 
    jl single_digit

  multi_digit:
    push ecx 
    mov ecx, 10 
    xor edx, edx
    div ecx 
    pop ecx 

    add al, '0'
    add dl, '0'

    mov [new_buffer + ecx], al 
    inc ecx 
    mov [new_buffer + ecx], dl 
    inc ecx 
    jmp conversion_done


  single_digit:
    add al, '0'
    mov [new_buffer + ecx], al
    inc ecx

  conversion_done:
    mov [new_buffer + ecx], byte ' '
    inc ecx 
    mov [new_buffer + ecx], byte '-'
    inc ecx 
    mov [new_buffer + ecx], byte ' '
    inc ecx 
    jmp loop 
 
  writeoutput:
    
    push 1 
    push new_buffer
    push ecx 
    call write 
    add esp, 12 

  mov esp, ebp 
  pop ebp 
  ret 


  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ;
  ; mov esi, eax      ; holds size of buffer 
  ; xor edx, edx 
  ; mov ecx, 1
  ; xor ebx, ebx
  ;
  ; write_num: 
  ;   cmp ebx, esi 
  ;   je end
  ;
  ;   mov eax, ecx  
  ;   add eax, '0'   
  ;
  ;   inc ecx 
  ;
  ;   mov [new_buffer + edx], al
  ;   inc edx
  ;   mov [new_buffer + edx], ' '
  ;   inc edx
  ;   mov [new_buffer + edx], '-'
  ;   inc edx
  ;   mov [new_buffer + edx], ' '
  ;   inc edx
  ;
  ; write_line:
  ;   mov al, [file_buffer + ebx] 
  ;   mov [new_buffer + edx], al
  ;   inc ebx 
  ;   inc edx 
  ;   cmp al, 0x0A 
  ;   je write_num
  ;
  ;   jmp write_line 
  ;
  ; end:
  ;   push 1
  ;   push new_buffer
  ;   push edx 
  ;   call write 
  ;   add esp, 12 
  ;
  ; mov esp, ebp
  ; pop ebp 
  ; ret 
