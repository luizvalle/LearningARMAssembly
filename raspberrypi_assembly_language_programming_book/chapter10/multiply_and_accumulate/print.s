.text
// Prints a square matrix
// Parameters:
//  r0: Address of the first element of the matrix
//  r1: Number of rows in the matrix
.global print_matrix
print_matrix:
  push {r4-r12, lr}
  mov r4, r0 // Store the matrix pointer
  mov r5, r1 // Store the row count
  mov r6, #0 // Row counter
row_loop:
  cmp r6, r5
  bge exit
  mov r8, #0 // Column counter
col_loop:
  cmp r8, r5
  bge end_row
  ldr r0, =format_str 
  ldr r1, [r4], #4 // Read element and increment to next
  bl printf
  add r8, r8, #1
  b col_loop
end_row:
  ldr r0, =new_line
  bl printf 
  add r6, r6, #1
  b row_loop
exit:
  pop {r4-r12, lr}
  bx lr

.data
format_str: .asciz "\t%3d"
new_line: .asciz "\n"
