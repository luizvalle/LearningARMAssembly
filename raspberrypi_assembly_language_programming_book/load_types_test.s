// Test different load types
.global _start
_start:
    ldr r1, =num
    ldr r2, [r1] // r2 = 0x1234ABCD
    ldrh r3, [r1] // r3 = 0xABCD
    ldrb r4, [r1] // r4 = 0xCD

    ldrb r5, [r1, #1] // r5 = 0xAB

    mov r7, #1
    svc 0

.data
num: .word 0x1234ABCD
    
