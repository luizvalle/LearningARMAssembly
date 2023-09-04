.MACRO to_upper str_in, str_out
ldr r0, =\str_in
ldr r1, =\str_out
mov r2, r1
1: // loop
    ldrb r3, [r0], #1
    cmp r3, #'a'
    blt 2f
    cmp r3, #'z'
    bgt 2f
    // Lower case
    add r3, #('A' - 'a')
2: // not lower case
    strb r3, [r2], #1
    cmp r3, #0
    bne 1b
    // End
    sub r0, r2, r1
.ENDM

