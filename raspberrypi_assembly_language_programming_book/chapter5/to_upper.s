.text

.global _start
_start:
    ldr r1, =str_in // r1 = &str_in
    ldr r2, =str_out // r2 = &str_out
loop:
    ldrb r3, [r1], #1 // r3 = *r1++
    cmp r3, #'a'
    blt not_lower
    cmp r3, #'z'
    bgt not_lower
lower:
    add r3, r3, #('A' - 'a')
not_lower: 
    strb r3, [r2], #1 // r3 = *r2++
    cmp r3, #0 // Did we reach the end?
    bne loop
end_loop:
    // Print
    mov r0, #1
    ldr r1, =str_out // r1 = &str_out
    sub r2, r2, r1  // r2 = (&str_out + len) - &str_out
    mov r7, #4
    svc 0

    // Exit
    mov r0, #0
    mov r7, #1
    svc 0

.data

str_in: .asciz "My name is Luiz, this is a test sTring.\n" // Zero terminated
str_out: .fill 255, 1, 0 // array of 255 bytes set to 0
