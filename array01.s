.data

.balign 4
a: .skip 400

.balign 4
b: .skip 8

.text

.global main
main:
    mov r0, #0
    ldr r1, addr_of_a
loop:
    cmp r0, #100
    beq end_loop
    add r3, r1, r0, LSL #2
    str r0, [r3]
    add r0, r0, #1
    b loop
end_loop:
    bx lr

addr_of_a: .word a
