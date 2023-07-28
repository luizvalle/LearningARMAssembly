.data

.balign 4
message1: .asciz "Type a number: "

.balign 4
message2: .asciz "%d times 5 is %d\n"

.balign 4
scan_pattern: .asciz "%d"

.balign 4
number: .word 0

.balign 4
return: .word 0

.text

.global main
main:
    ldr r0, addr_of_return
    str lr, [r0]

    ldr r0, addr_of_message1
    bl printf

    ldr r0, addr_of_scan_pattern
    ldr r1, addr_of_number
    bl scanf

    ldr r0, addr_of_number
    ldr r0, [r0]
    bl mult_5
    
    mov r2, r0
    ldr r0, addr_of_message2
    ldr r1, addr_of_number
    ldr r1, [r1]
    bl printf

    ldr r0, addr_of_number
    ldr r0, [r0]

    ldr r1, addr_of_return
    ldr lr, [r1]

    bx lr

mult_5:
    add r0, r0, LSL #2
    bx lr

addr_of_message1: .word message1
addr_of_message2: .word message2
addr_of_scan_pattern: .word scan_pattern
addr_of_number: .word number
addr_of_return: .word return

.global printf
.global scanf
