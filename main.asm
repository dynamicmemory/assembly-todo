 ; TODO delete 
 ; TODO str2int
 ; TODO int2str (thinking about this... probably just add '0' to the input)
 ; TODO writestdout
 ; TODO abstract out moving the file pointer from read and add as its now used twice 

%include "stdlib.asm"

section .data

section .bss 
file_buffer resb BUFFERSIZ 
stats resb 144

section .text
global _start
extern open
extern fsize
extern read 
extern write  
extern newline
extern cleanbuff
extern command 
extern clearscreen
extern add
extern delete
_start:
  push ebp
  mov ebp, esp
  sub esp, 8
  
  call open ; Open the file 
 
  mov dword [ebp - 4], eax ; move the fd into the stack
  
  mainloop:

    call clearscreen 

    ; Get the size of the file
    push FNAME
    call fsize
    add esp, 4 

    mov dword [ebp - 8], eax ; move the file size into the stack 

    ; Read
    push dword [ebp - 4]
    push file_buffer
    push dword [ebp - 8]
    call read 
    add esp, 12
    
    ; print to stdout
    push 1 
    push file_buffer
    push dword [ebp - 8]
    call write
    add esp, 12
    
    call newline

    ; Ask user what they would like to do 
    call command

    ; control flow different options
    cmp al, 'a'
    je addline

    cmp al, 'd'
    je deleteline
    
    cmp al, 'e'
    je exit

    jmp mainloop

  ; add to the list 
  addline:
    push dword [ebp - 4]
    push dword [ebp -8]
    call add
    add esp, 8
    jmp mainloop 
  
  ; delete from the list
  deleteline:
    push dword [ebp - 4]
    push dword [ebp -8]
    call delete 
    jmp mainloop

  ; exit program
  exit:
  mov esp, ebp
  pop ebp
  mov eax, 1
  xor ebx, ebx
  int LINUS
