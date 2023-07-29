.data

.balign 4
message1: .asciz "Please, type a number in the range [0, 12]: "

.balign 4
message2: .asciz "%d! = %d\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
number: .word 0

.text

.global main
main:
    str lr, [sp, #-8]!

    ldr r0, addr_of_message1
    bl printf

    ldr r0, addr_of_scan_pattern
    ldr r1, addr_of_number
    bl scanf

    ldr r0, [r1]
    bl factorial

    str r0, [sp, #-8]!

    ldr lr, [sp], #8
    bx lr

factorial:
    str lr, [sp, #-8]!
    cmp r0, #0
    beq base_case
    str r0, [sp, #-8]!
    sub r0, r0, #1
    bl factorial
    ldr r1, [sp], #8
    mul r0, r1, r0
    bl end_factorial
base_case:
    mov r0, #1
end_factorial:
    ldr lr, [sp], #8
    bx lr

addr_of_message1: .word message1
addr_of_message2: .word message2
addr_of_scan_pattern: .word scan_pattern
addr_of_number: .word number

.global printf
.global scanf
