.global int13
.intel_syntax noprefix
int13:
        mov eax, cr0
        or eax, 1
        mov cr0, eax
        mov ah, 0
        mov al, 0x13
        int 0x10
        ret
