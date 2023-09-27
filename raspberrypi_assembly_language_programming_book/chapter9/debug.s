.macro printReg reg
  push {r0-r4, lr}
  mov r2, r\reg
  mov r3, r\reg
  mov r1, #\reg
  add r1, #'0'
  ldr r0, =ptfStr
  bl printf
  pop {r0-r4, lr}
.endm
.macro printStr str
  push {r0-r4, lr}
  ldr r0, =1f
  bl printf
  pop {r0-r4, lr}
  b 2f
  1: .asciz "\str\n" 
  .align 4
  2:
.endm

.data
ptfStr: .asciz "R%c = %16d, 0x%08x\n"
.align 4

.text

