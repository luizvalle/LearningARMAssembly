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
  ldr r0, [r4, #4] // Load first argument (skip program name)
  mov r5, r0 // Save first argument
  bl get_end 
  mov r1, r0 // Save pointer to end in r1
  mov r0, r5 // Retrieve pointer to first element
  bl str_to_long
  printStr "First input:"
  printReg 0
  printReg 1
  mov r6, r0 // Save high 32 bits
  mov r7, r1 // Save low 32 bits

  ldr r0, [r4, #8] // Load second argument (skip program name)
  mov r5, r0 // Save second argument
  bl get_end 
  mov r1, r0 // Save pointer to end in r1
  mov r0, r5 // Retrieve pointer to first element
  bl str_to_long
  printStr "Second input:"
  printReg 0
  printReg 1
  
  mov r2, r6
  mov r3, r7
  bl add64

  printStr "Sum:"
  printReg 0
  printReg 1
exit:
  pop {r4-r12, lr}
  bx lr
