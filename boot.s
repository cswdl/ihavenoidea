/* Declare constants for the multiboot header. */
[bits 16]
.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM


.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:

.section .text
.global _start
.type _start, @function
idt_real:
	dw 0x3ff		; 256 entries, 4b each = 1K
	dd 0			; Real Mode IVT @ 0x0000
 
savcr0:
	dd 0			; Storage location for pmode CR0.
GoRMode:
	mov sp, 0x8000		; pick a stack pointer.
	mov ax, 0		; Reset segment registers to 0.
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	lidt [idt_real]
	sti			; Restore interrupts -- be careful, unhandled int's will kill it.
_start:
 
	cli			; Disable interrupts.
 
	; Need 16-bit Protected Mode GDT entries!
	mov eax, DATASEL16	; 16-bit Protected Mode data selector.
	mov ds, eax
	mov es, eax
	mov fs, eax
	mov gs, eax
	mov ss, eax
 
 
	; Disable paging (we need everything to be 1:1 mapped).
	mov eax, cr0
	mov [savcr0], eax	; save pmode CR0
	and eax, 0x7FFFFFFe	; Disable paging bit & disable 16-bit pmode.
	mov cr0, eax
 
	jmp 0:GoRMode		; Perform Far jump to set CS.

		/*
	     AL  Type     Format   Cell  Colors        Adapter  Addr  Monitor
      0  text     40x25     8x8* 16/8 (shades) CGA,EGA  b800  Composite
      1  text     40x25     8x8* 16/8          CGA,EGA  b800  Comp,RGB,Enh
      2  text     80x25     8x8* 16/8 (shades) CGA,EGA  b800  Composite
      3  text     80x25     8x8* 16/8          CGA,EGA  b800  Comp,RGB,Enh
      4  graphic  320x200   8x8  4             CGA,EGA  b800  Comp,RGB,Enh
      5  graphic  320x200   8x8  4 (shades)    CGA,EGA  b800  Composite
      6  graphic  640x200   8x8  2             CGA,EGA  b800  Comp,RGB,Enh
      7  text     80x25    9x14* 3 (b/w/bold)  MDA,EGA  b000  TTL Mono
      8,9,0aH  PCjr modes
      0bH,0cH  (reserved; internal to EGA BIOS)
      0dH graphic  320x200   8x8  16            EGA,VGA  a000  Enh,Anlg
      0eH graphic  640x200   8x8  16            EGA,VGA  a000  Enh,Anlg
      0fH graphic  640x350  8x14  3 (b/w/bold)  EGA,VGA  a000  Enh,Anlg,Mono
      10H graphic  640x350  8x14  4 or 16       EGA,VGA  a000  Enh,Anlg
      11H graphic  640x480  8x16  2             VGA      a000  Anlg
      12H graphic  640x480  8x16  16            VGA      a000  Anlg
      13H graphic  640x480  8x16  256           VGA      a000  Anlg
      check:http://webpages.charter.net/danrollins/techhelp/0113.HTM
	*/
	
	mov $00, %ah //Int 10/AH=00h = SET VIDEO MODE, setting ah to 00
	mov $0x13, %al //Int 10/AL=13 = DESIRED VIDEO MDOE, setting to 13h for 2 5 6 colors
	int $0x10 //finally, call int 10
	call main
	cli
1:	hlt
	jmp 1b
.size _start, . - _start
