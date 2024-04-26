nasm -f elf32 hello.asm -o hello.o
ld  -dynamic-linker /lib/i386-linux-gnu/ld-linux.so.2 /lib/i386-linux-gnu/libc.so.6 /lib/i386-linux-gnu/libc.a hello.o -o hello
