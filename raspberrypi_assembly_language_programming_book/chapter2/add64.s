.global _start
_start:
    // 0x00000003FFFFFFFF
    mov r2, #0x00000003
    mov r3, #0xFFFFFFFF

    // 0x0000000500000001
    mov r4, #0x00000005
    mov r5, #0x00000001

    adds r1, r3, r5 // Add lower part and set carry
    adc r0, r2, r4 // Add higher part and use carry

    // Exit
    mov r7, #1
    svc 0

