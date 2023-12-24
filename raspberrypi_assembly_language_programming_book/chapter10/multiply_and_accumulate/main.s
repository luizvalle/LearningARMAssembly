.include "fileio.s"

.equ N, 3 // Number of rows and columns in the matrices

.text
.global main
main:
  push {r4-r12, lr}
  print_str "Matrix A:\n"
  ldr r0, =A
  mov r1, #N
  bl print_matrix
  print_str "Matrix B:\n"
  ldr r0, =B
  mov r1, #N
  bl print_matrix
  print_str "Matrix AB = C:\n"
// Calulate C := AB
  ldr r0, =A
  ldr r1, =B
  ldr r2, =C
  mov r3, #N
  bl matrix_multiply
// Print C
  ldr r0, =C
  mov r1, #N
  bl print_matrix
// Cleanup and exit
  pop {r4-r12, lr}
  mov r0, #0
  bx lr

.data
A: .word 1, 2, 3
   .word 4, 5, 6
   .word 7, 8, 9

B: .word 9, 8, 7
   .word 6, 5, 4
   .word 3, 2, 1

C: .fill 9, 4, 0
