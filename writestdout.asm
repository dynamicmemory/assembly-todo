%include "stdlib.asm"

section .data 

fd equ 12 
size equ 8 

space db " - ", 0x0A

section .bss 

file_buffer resb BUFFERSIZ 
new_buffer resb BUFFERSIZ 
space_buffer resb 4

section .text 
extern write 
extern read 
global writestdout
writestdout:
  push ebp 
  mov ebp, esp 

  push dword [ebp + fd]
  push file_buffer
  push BUFFERSIZ
  call read 
  add esp, 12 

  mov esi, eax      ; holds size of buffer 
  xor edx, edx 
  mov ecx, 1
  
  write_num: 
    cmp ebx, esi 
    je end
    mov [new_buffer + edx], ecx 
    inc edx
    inc ecx
    mov eax, space 
    write_space:
      cmp al, 0x0A 
      je write_line

      mov [new_buffer + edx], al
      inc edx 
      jmp write_space 
  write_line:
    mov [file_buffer + ebx], al 
    mov al, [new_buffer + edx]
    inc ebx 
    inc edx 
    cmp al, 0x0A 
    je write_num

    jmp write_line 

  end:
    push 1
    push new_buffer
    push edx 
    call write 
    add esp, 12 

  mov esp, ebp
  pop ebp 
  ret 
