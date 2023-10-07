.include "debug.s"

.global main
main:
  push {r4-r12, lr}
  cmp r0, #3 // Check if argc == 3
  beq correct_arguments
  ldr r0, =error_str
  ldr r1, [r1]
  bl printf 
  b exit
correct_arguments:
  mov r4, r1 // Save argv
  sub sp, #4 // Get more space in the stack

  ldr r0, [r4, #4] // Load first argument
  mov r1, sp
  bl strtoi
  ldr r5, [sp]

  ldr r0, [r4, #8] // Load second argument  
  mov r1, sp
  bl strtoi
  ldr r6, [sp], #4

  printStr "Inputs:"
  printReg 5
  printReg 6

  mul r7, r5, r6
  printStr "mul r7 = r5 * r6:" 
  printReg 7

  smull r7, r8, r5, r6
  printStr "smull r7, r8 = r5 * r6"
  printReg 7
  printReg 8

  umull r7, r8, r5, r6
  printStr "umull r7, r8 = r5 * r6"
  printReg 7
  printReg 8

  smmul r7, r5, r6
  printStr "smmul r7 = r5 * r6:" 
  printReg 7

  smulbb r7, r5, r6
  printStr "smulbb r7 = r5 * r6:" 
  printReg 7

  smulwb r7, r5, r6
  printStr "smuwb r7 = r5 * r6:" 
  printReg 7

exit: 
  pop {r4-r12, lr}
  bx lr

.data
error_str: .asciz "Usage: %s <x> <y>\n"

