.include "debug.s"

.global main
main:
  push {r4-r12, lr}
  mov r2, #100
  mov r3, #4

  printStr "Inputs:"
  printReg 2
  printReg 3

  udiv r4, r2, r3
  printStr "Output:"
  printReg 4

  mov r2, #-100
  mov r3, #4

  printStr "Inputs:"
  printReg 2
  printReg 3

  sdiv r4, r2, r3
  printStr "Output:"
  printReg 4

  pop {r4-r12, lr}
  bx lr
