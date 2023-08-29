.global _start
_start:
    // Load r2 with 0x4F5D6E3A
    mov r2, #0x6E3A
    movt r2, #0x4F5D

    mov r1, r2

    mov r1, r2, LSL #1
    mov r1, r2, LSR #1
    mov r1, r2, ASR #1
    mov r1, r2, ROR #1
    mov r1, r2, RRX

    // Mnemonics
    LSL r1, r2, #1
    LSR r1, r2, #1
    ASR r1, r2, #1

    mov r1, #0xAB000000

//    mov r1, #0xABCDEF11

    mvn r1, #45

    // Will be converted to mvn
    mov r1, #0xFFFFFFFE

    // Exit
    mov r0, #0
    mov r7, #1
    svc 0

