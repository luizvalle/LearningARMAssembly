.global _start
_start:
    ldr r1, =arr1
    
    ldr r2, =#0x1234ABCD
    str r2, [r1, #(2 * 4)] // Put the value in arr1[2]
    ldr r3, [r1, #(2 * 4)]

    ldr r2, =#0xFFFFFFFF
    mov r4, #3
    str r2, [r1, r4, LSL #2] // arr1[3] = r2
    ldr r5, [r1, r4, LSL #2] // r5 = arr[3]

    mov r7, #1
    svc 0

.data

arr1: .fill 10, 4, 0 // Array of 10 4-byte words filled with 0
