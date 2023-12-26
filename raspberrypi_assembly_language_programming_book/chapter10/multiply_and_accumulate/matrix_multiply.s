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
    // Save parameters
    mov r4, r0
    mov r5, r1
    mov r6, r2
    mov r8, r3
    mov r9, r3
    // Transpose matrix B
    mov r0, r5
    mov r1, r9
    bl transpose
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
    // Transpose matrix B back
    mov r0, r5
    mov r1, r9
    bl transpose
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

// Transposes a square matrix in-place
// Parameters
//  r0: The address to the first element of the matrix to be transposed
//  r1: The number of rows in the matrix
transpose:
    push {r4-r12, lr}
    mov r4, r1 // i index
i_loop:
    subs r4, r4, #1
    blt exit_t
    mov r5, r4 // j index
    add r5, r5, #1
j_loop:
    subs r5, r5, #1
    blt i_loop
    mul r6, r4, r1
    add r6, r6, r5
    ldr r8, [r0, r6, LSL #2] // r8 = M[i, j]
    mul r9, r5, r1
    add r9, r9, r4
    ldr r10, [r0, r9, LSL #2] // r10 = M[j, i]
    // M[i, j] = M[j, i]
    str r10, [r0, r6, LSL #2]
    str r8, [r0, r9, LSL #2]
    b j_loop
exit_t:
    pop {r4-r12, lr}
    bx lr
