.data

message: .asciz "Type a number: "
scan_pattern: .asciz "%d"
message2: .asciz "Length of the Hailstone sequence for %d is %d\n"

.text

.global main
main:
    str lr, [sp, #4]!

    ldr r0, addr_of_message
    bl printf

    ldr r0, addr_of_scan_pattern
    sub sp, sp, #4
    mov r1, sp

    ldr r0, [sp]
    bl collatz

    mov r2, r0
    ldr r0, addr_of_message2
    ldr r1, [sp], #-4
    bl printf

    ldr lr, [sp], #-4
    bx lr

collatz:
    mov r1, r0
    mov r0, #0
collatz_loop:
    cmp r1, #1
    beq collatz_end
    and r2, r1, #1
    cmp r2, #0
    beq collatz_even
collatz_odd:
    add r1, r1, r1, LSL #1
    add r1, r1, #1
    b collatz_end_loop
collatz_even:
    mov r1, r1, ASR #1
    b collatz_loop
collatz_end_loop:
    add r0, r0, #1
    b collatz_loop
collatz_end:
    bx lr

.global printf
.global scanf

addr_of_message: .word message
addr_of_message2: .word message2
addr_of_scan_pattern: .word scan_pattern
