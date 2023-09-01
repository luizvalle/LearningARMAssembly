.global _start
_start:
    mov r0, #1
loop:
    add r0, #1
    cmp r0, #10
    bne loop

    // Exit
    mov r7, #1
    svc 0
