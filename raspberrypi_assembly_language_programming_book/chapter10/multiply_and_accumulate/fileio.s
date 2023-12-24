.macro print_str str
    ldr r0, =1f
    bl printf
    b 2f
    1: .asciz "\str"
    .align 4
    2:
.endm
