.global int13

int13:
        movl    %cr0,%eax
        orl     $1,%eax
        movl    %eax,%cr0
        jmp     cs:setgraphics
setgraphics:
        movb    $0,%ah
        movb    $0x13,%al
        int     $0x10
        ret
