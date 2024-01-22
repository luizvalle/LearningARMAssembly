// Converts a string to 32-bit floating point
// r0: Pointer to the beginning of the null-terminated string
// Returns the result in r0
.global strtof
strtof:
    push {r4-r12, lr}
    vpush {s16-s31}
    mov r4, #0 // Accumulator for integer part
integer_loop:
    ldrb r5, [r0], #1
    cmp r5, #'.'
    beq decimal_part
    cmp r5, #0
    beq end_no_decimal
    cmp r5, #'9'
    bgt not_number
    subs r5, #'0'
    blt not_number
    // Multiply current number by 10
    add r6, r4, r4, LSL #3 // r4 + 8 * r4 = 9 * r4
    add r4, r6 // 9 * r4 + r4 = 10 * r4
    // Add the new number
    add r4, r5
    b integer_loop
decimal_part:
   add r0, #1 // Skip decimal point
   vmov s16, #0 // Accumulator for decimal part

decimal_loop:
    ldrb r5, [r0], #1
    cmp r5, #0
    beq end_decimal
    cmp r5, #'9'
    bgt not_number
    subs r5, #'0'
    blt not_number
    b decimal_loop
not_number:
    b exit // Should do error handling, but skipping it
end_no_decimal:
    mov r0, r4
    b exit
end_decimal:
    vmov s18, r4
    vadd.f32 s16, s18
    vmov r0, s16
exit:
    vpop {s16-s31}
    pop {r4-r12, lr}
    bx lr
