main: main.o open.o fsize.o read.o write.o newline.o command.o clearscreen.o add.o delete.o writestdout.o
	ld -m elf_i386 main.o open.o fsize.o read.o write.o newline.o command.o clearscreen.o add.o delete.o writestdout.o -o main

main.o: main.asm
	nasm -f elf32 main.asm -o main.o

open.o: open.asm
	nasm -f elf32 open.asm -o open.o

fsize.o: fsize.asm
	nasm -f elf32 fsize.asm -o fsize.o
	
read.o: read.asm 
	nasm -f elf32 read.asm -o read.o 

write.o: write.asm 
	nasm -f elf32 write.asm -o write.o 

newline.o: newline.asm 
	nasm -f elf32 newline.asm -o newline.o 

command.o: command.asm 
	nasm -f elf32 command.asm -o command.o 

clearscreen.o: clearscreen.asm 
	nasm -f elf32 clearscreen.asm -o clearscreen.o 

add.o: add.asm 
	nasm -f elf32 add.asm -o add.o

delete.o: delete.asm 
	nasm -f elf32 delete.asm -o delete.o

writestdout.o: writestdout.asm 
	nasm -f elf32 writestdout.asm -o writestdout.o

clean:
	rm main main.o open.o fsize.o read.o write.o newline.o command.o add.o delete.o writestdout.o
