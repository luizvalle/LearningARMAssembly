// Takes in a pointer to a null terminated string representing
// an integer in decimal and a pointer to memory that can hold
// the 32 bit value.
// On success, place the signed integer in two's complement in
// the memory location and return 0.
// On error, returns -1.
.global strtoi
strtoi:
  push {r4-r12, lr}
  mov r5, #0 // 0 the accumulator
  ldrb r4, [r0], #1 // Read the first value and increment the pointer
  cmp r4, #'-'
  beq negative_sign
  cmp r4, #'0'
  blt not_a_number
  cmp r4, #'9'
  bgt not_a_number
  mov r6, #0 // Positive number 
  sub r5, r4, #'0'
  b loop
not_a_number:
  mov r0, #-1
  b exit
negative_sign:
  mov r6, #1 // Negative number
loop:
  ldrb r4, [r0], #1
  cmp r4, #0
  beq done
  cmp r4, #'0'
  blt not_a_number
  cmp r4, #'9'
  bgt not_a_number
  lsl r7, r5, #3
  add r5, r7, r5, LSL #1
  sub r4, #'0'
  add r5, r4
  b loop
done:
  cmp r6, #0
  beq store_result
  mvn r5, r5
  add r5, #1
store_result:
  str r5, [r1]
  mov r0, #0
exit:
  pop {r4-r12, lr}
  bx lr

