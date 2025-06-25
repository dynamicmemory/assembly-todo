main: main.o open.o fsize.o
	ld -m elf_i386 main.o open.o fsize.o -o main

main.o: main.asm
	nasm -f elf32 main.asm -o main.o

open.o: open.asm
	nasm -f elf32 open.asm -o open.o

fsize.o: fsize.asm
	nasm -f elf32 fsize.asm -o fsize.o
	
clean:
	rm main main.o
