.global int13

int13:
        cli
        movl    %cr0,%eax
        andb    $not %1,%al
        movl    %eax,%cr0
        sti
        movb    $0,%ah
        movb    $0x13,%al
        int     $0x10
        ret
