i686-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-gcc -c video.c -o video.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i686-elf-as V86.asm -o V86.o -msyntax=intel
i686-elf-as boot.s -o boot.o
i686-elf-gcc -T linker.ld -o ihavenoidea.bin -ffreestanding -O2 -nostdlib boot.o kernel.o video.o V86.o -lgcc
qemu-system-i386 -kernel ihavenoidea.bin
