.data

str1: .asciz "AbCdEfGhIjKlMnOpQrStUvWxYz\n"
str2: .asciz "Another string!\n"
buffer: .fill 255, 1, 0

.text

.include "upper_macro.s"

.global _start
_start:
    to_upper str1, buffer

    mov r2, r0
    mov r0, #1
    ldr r1, =buffer
    mov r7, #4
    svc 0

    to_upper str2, buffer

    mov r2, r0
    mov r0, #1
    ldr r1, =buffer
    mov r7, #4
    svc 0

    mov r0, #0
    mov r7, #1
    svc 0

