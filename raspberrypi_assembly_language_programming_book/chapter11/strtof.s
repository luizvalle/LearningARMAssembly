// Converts a string to 32-bit floating point
// r0: Pointer to the beginning of the string
// r1: Size of the string
// Returns the result in r0
.global strtof
strtof:
    push {r4-r12, lr}
    mov r4, #0 // Accumulator for integer part
integer_loop:
    cmp r0, '.'
    beq end_of_integer
    cmp r0, #0
    beq end_no_decimal
    b integer_loop
end_of_integer:
end_no_decimal:
    pop {r4-r12, lr}
    bx lr
