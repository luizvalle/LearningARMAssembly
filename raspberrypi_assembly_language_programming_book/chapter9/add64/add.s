.global add64
add64:
  push {r4-r12, lr}
  adds r1, r3
  adc r0, r2 
  pop {r4-r12, lr}
  bx lr
