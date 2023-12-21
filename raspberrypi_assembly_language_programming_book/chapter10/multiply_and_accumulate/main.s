.text
.global main
main:
  push {r4-r12, lr}
  bl matrix_multiply
  ldr r0, =A
  mov r1, #3
  bl print_matrix
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
