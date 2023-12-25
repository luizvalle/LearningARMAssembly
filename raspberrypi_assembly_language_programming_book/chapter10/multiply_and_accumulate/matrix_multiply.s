.text
// Multiplies two square matrices
// Parameters
//  r0: Address pointing to the first element in matrix A
//  r1: Address pointing to the first element in matrix B
//  r2: Address pointing to the a place where the result will be put
//  r3: Number of rows in each matrix
.global matrix_multiply
matrix_multiply:
    push {r4-r12, lr}
    mov r4, r0
    mov r5, r1
    mov r6, r2
    mov r8, r3
    mov r9, r3
row_A_loop:
    subs r8, r8, #1
    blt exit_mm
    mov r10, r9
    mov r11, r5
row_B_loop:
    subs r10, r10, #1
    blt end_row_A
    mov r0, r4
    mov r1, r11
    mov r2, r9
    bl dot_product
    str r1, [r6], #4
    add r11, r11, r9, LSL #2
    b row_B_loop
end_row_A:
    add r4, r4, r9, LSL #2
    b row_A_loop
exit_mm:
    pop {r4-r12, lr}
    bx lr

// Calculates the dot product of two vectors
// Parameters
//  r0: Address pointing to the first element of vector x
//  r1: Address pointing to the first element of vector y
//  r2: Length of both vectors
// Returns:
//  r0: The upper 32 bits of a * b
//  r1: The lower 32 bits of a * b
dot_product:
    push {r4-r12, lr}
    mov r4, #0 // Low order accumulator
    mov r5, #0 // High order accumulator
loop:
    subs r2, r2, #1
    blt exit_dp // If r2 is negative
    ldr r8, [r0], #4 // x[i]
    ldr r9, [r1], #4 // y[i]
    smlal r4, r5, r8, r9 
    b loop
exit_dp:
    mov r0, r5
    mov r1, r4
    pop {r4-r12, lr}
    bx lr
