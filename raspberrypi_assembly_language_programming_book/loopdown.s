.global _start
_start:
    mov r0, #10
loop:
    subs r0, #1 // Will set Z if 0
    bne loop

    // Exit
    mov r7, #1
    svc 0
