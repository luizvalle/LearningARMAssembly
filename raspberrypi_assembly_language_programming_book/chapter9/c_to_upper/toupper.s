.global to_upper
to_upper:
  push {r4-r12, lr}
  mov r4, r0 // Save the pointer to the string
loop:
  ldrb r5, [r4], #1 // r5 = *r4++
  cmp r5, #'a'
  blt not_lower_case
  cmp r5, #'z'
  bgt not_lower_case
  add r5, #'A' - 'a' // Convert to upper case
not_lower_case:
  strb r5, [r1], #1
  cmp r5, #0 // Is it the null-terminator?
  bne loop
  sub r0, r4, r0
  sub r0, #1
  pop {r4-r12, lr}
  bx lr
