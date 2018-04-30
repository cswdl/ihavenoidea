.global entering_v86

entering_v86:
        movl    %esp,%ebp
        pushl   4(%ebp)
        pushl   8(%ebp)
        .intel_syntax noprefix
        pushfd
        .att_syntax noprefix
        orl     $(1 << 17),(%esp)
        pushl   12(%ebp)
        pushl   16(%ebp)
        iret
