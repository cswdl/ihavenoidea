.global int13

int13:
        cli
        movl    %cr0,%eax
        .intel_syntax
        and     al,not 1
        .att_syntax
        movl    %eax,%cr0
        sti
        movb    $0,%ah
        movb    $0x13,%al
        int     $0x10
        ret
