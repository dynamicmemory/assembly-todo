%include "stdlib.asm"

section .data 

question db "Which line would you like to delete?", 0x0A, 0
qsize equ $ - question  

fd equ 12 
size equ 8 

section .bss 

file_buffer resb BUFFERSIZ
new_file resb BUFFERSIZ
input_buffer resb 5

section .text
extern write 
extern read 
extern open 
extern cleanbuff
global delete
delete:
  push ebp 
  mov ebp, esp 
  sub esp, 4


  push file_buffer
  push BUFFERSIZ
  call cleanbuff
  add esp, 8 

  push new_file 
  push BUFFERSIZ
  call cleanbuff
  add esp, 8 

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
  xor ecx, ecx 
  convert_digit: 
    mov al, [input_buffer + ecx]
    cmp al, 0x0A
    je converted 

    sub al, '0'  
    movzx eax, al        ; zero extend the reg, this shit fucked me for a minute
    imul edi, edi, 10 
    add edi, eax 

    inc ecx 
    jmp convert_digit

  converted:
  mov [ebp - 4], edi     ; move the value to the stack for safety for a minute 

  ; Read file into buffer 
  push dword [ebp + fd]
  push file_buffer
  push BUFFERSIZ
  call read 
  add esp, 12 
  
  mov esi, eax 
  mov edi, [ebp - 4]     ; get the line number back from the stack  
  xor ebx, ebx
  xor ecx, ecx
  xor edx, edx
  loop:
    xor eax, eax  
    cmp edi, 1 
    je loop3 

    dec edi 
    loop2:
    cmp al, 0x0A 
    je loop 

    mov eax, [file_buffer + ecx] 
    mov [new_file + edx], al

    inc ecx 
    inc edx 

    jmp loop2 
  loop3:
    cmp al, 0x0A
    je loop4 

    mov al, [file_buffer + ecx]
    inc ecx 
    jmp loop3
  loop4:
    cmp esi, ecx 
    je loop_end 

    mov eax, [file_buffer + ecx]
    mov [new_file + edx], al
    inc ecx
    inc edx

    jmp loop4
  loop_end:
    mov [ebp - 4], edx
    ; close original file 
    mov eax, 6
    mov ebx, [ebp + 8]
    int LINUS

    ; open new file in trunc mode 
    mov eax, 5
    mov ebx, FNAME
    mov ecx, O_TRUNC
    mov edx, PERMISSIONS
    int LINUS 
    ; write new buffer to it 
    mov edx, [ebp - 4]     ; Move new file size back into edx 
    mov [ebp - 4], eax     ; Move new fd onto the stack for a minute
    push eax 
    push new_file 
    push edx 
    call write 
    add esp, 12 
    ; close new file
    mov eax, 6
    mov ebx, [ebp - 4]
    int LINUS
    ; open new new file in origin mode 
    mov eax, 5
    mov ebx, FNAME
    mov ecx, O_RDWR_C_A
    mov edx, PERMISSIONS
    int LINUS
    ; return fd in eax, deal with rest in main

  end:
    mov esp, ebp 
    pop ebp 
    ret 

