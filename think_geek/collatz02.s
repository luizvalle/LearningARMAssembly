.data

message1: .asciz "Please, type a number: "
scan_pattern: .asciz "%d"
message2: .asciz "The collatz sequence of %d has length %d.\n"

.text

.global main
main:
    str lr, [sp, #-4]!
    sub sp, sp, #4

    ldr r0, addr_of_message1
    bl printf

    ldr r0, addr_of_scan_pattern
    mov r1, sp
    bl scanf

    ldr r0, [sp]
    bl collatz

    mov r2, r0
    ldr r1, [sp]
    ldr r0, addr_of_message2
    bl printf

    add sp, sp, #4
    ldr lr, [sp], #4
    bx lr

collatz:
    mov r1, r0
    mov r0, #0
collatz_loop:
    cmp r1, #1
    beq collatz_end
    and r2, r1, #1
    cmp r2, #0
collatz_even:
    moveq r1, r1, ASR #1
collatz_odd:
    addne r1, r1, r1, LSL #1
    addne r1, r1, #1
collatz_end_loop:
    add r0, r0, #1
    b collatz_loop
collatz_end:
    bx lr

.global printf
.global scanf

addr_of_message1: .word message1
addr_of_scan_pattern: .word scan_pattern
addr_of_message2: .word message2
