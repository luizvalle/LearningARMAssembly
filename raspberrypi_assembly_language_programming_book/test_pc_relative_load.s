.global _start
_start:
    mov r0, #1
    ldr r1, =str
    mov r2, #14
    mov r7, #4
    svc 0
    .ltorg // Assemble literal pool
    // You must place literal pools where the processor does not attempt to execute them as instructions. Place them after unconditional branch instructions, or after the return instruction at the end of a subroutine.
    .rept 4096
        cmp r0, #0
    .endr

    mov r7, #1
    svc 0

.data

str: .ascii "Hello, World!\n"
