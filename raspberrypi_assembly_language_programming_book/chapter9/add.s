.include "debug.s"

.global main
main:
  push {r4-r12, lr}
  mov r4, r1 // Save argv
  cmp r0, #3 // Check if argc == 3
  beq correct_args
  // argc != 3
  printStr "Usage: ./add <num1> <num2>"
  b exit
correct_args:
  // argc == 3
   
exit:
  pop {r4-r12, lr}
  bx lr
