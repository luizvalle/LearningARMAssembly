// Takes a pointer to the first element in the string
// and a pointer to the last character
// Returns the 64-bit integer (first 32 bits
// in r1 and second 32 bits in r0)
.global str_to_long
str_to_long:
  push {r4-r12, lr}
  mov r4, #0 // Accumulator for top 32 bits
  mov r5, #0 // Accumulator for bottom 32 bits
  mov r6, #0 // Counter
loop_str_to_long:
  cmp r1, r0
  blt exit
  ldrb r7, [r1], #-1
  sub r7, #'0' // Convert char to int
  mov r8, r6
mult_by_10_loop:
  cmp r8, #0
  beq continue 
  // r7 = 8 * r7 + 2 * r7
  lsl r9, r7, #3
  add r7, r9, r7, LSL #1
  sub r8, #1
  b mult_by_10_loop 
continue:
  adds r5, r7 // Accumulate into r5
  adc r4, #0 // Add the carry to r4
  add r6, #1
  b loop_str_to_long
exit: 
  mov r0, r4
  mov r1, r5
  pop {r4-r12, lr}
  bx lr

// Takes a pointer to a null terminated string
// Returns a pointer to the last character
.global get_end
get_end:
  push {r4-r12, lr}
loop_get_end:
  ldrb r4, [r0], #1
  cmp r4, #0 // Is it the null terminator
  bne loop_get_end
  // Reached null terminator
  pop {r4-r12, lr}
  // r0 will contain the pointer
  sub r0, #2 // Ignore the 0
  bx lr

