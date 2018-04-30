.global int13

int13:
        cli
        mov     eax,cr0
        and     al,not %1
        mov     cr0,eax
        sti
        mov ah, 0
        mov al, 0x13
        int 0x10
        ret
        
