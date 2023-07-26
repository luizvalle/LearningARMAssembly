.data

greeting:
    .asciz "Hello world"

.balign 4
return: .word 0

.text

.global main
main:
    ldr r1, address_of_return
    str lr, [r1]

    ldr r0, address_of_greeting

    bl puts

    ldr r1, address_of_return
    ldr lr, [r1]
    bx lr

address_of_greeting: .word greeting
address_of_return: .word return

.global puts
