.data

mynumber: .word 0x1234ABCD

.text

.global _start
_start:
    ldr r1, =mynumber
    ldr r2, [r1]

    mov r7, #1
    svc 0

