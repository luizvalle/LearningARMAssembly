.global _start
_start:
    // Multiply 2 by -1
    mvn r0, #2 // One's complement
    add r0, r0, #1 // Add 1

    mov r7, #1
    svc 0

