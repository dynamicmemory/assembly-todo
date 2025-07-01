; Sys calls 
LINUS equ 0x80

; Buffer related
BUFFERSIZ equ 4096

; Opening files 
FNAME db "database.txt", 0
O_RDWR_C_A equ 0x442
O_TRUNC equ 0x202
PERMISSIONS equ 0644
