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
  pop {r4-r12, lr}
  bx lr
