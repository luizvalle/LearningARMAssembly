.text

.global to_upper
to_upper:
    stmda sp!, {r4-r5}
    mov r4, r1
loop:
    ldrb r5, [r0], #1
    cmp r5, #'a'
    blt not_lower
    cmp r5, #'z'
    bgt not_lower
    add r5, r5, #('A' - 'a')
not_lower:
    strb r5, [r1], #1
    cmp r5, #0
    bne loop
end:
    sub r0, r1, r4
    ldmib sp!, {r4-r5}
    bx lr
