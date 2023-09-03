.data

hexstr: .ascii "0x12345678\n"

.text

.global _start
_start:
    // Number to print: 0xDE6512AB
    mov r1, #0x12AB
    movt r1, #0xDE65

    // Start at the least significant bit
    ldr r2, =hexstr
    add r2, #9

    mov r3, #0
loop: // while r3 < 8
    cmp r3, #8
    bge end_loop
    and r4, r1, #0xf // Mask off the last 4 bits
    cmp r4, #10
    bge else
if_lt_10: // Last four bits can be represented by 0-9
    add r4, r4, #'0'
    b endif
else: // Last four bits have to be represented by A-F
    sub r4, r4, #10
    add r4, r4, #'A'
endif:
    strb r4, [r2] // Store new byte
    sub r2, #1
    add r3, #1
    lsr r1, #4 // Shift off the 4 bits we just processed
    b loop
end_loop:
    // Print
    mov r0, #1 // Stdout = 1
    ldr r1, =hexstr // String to print
    mov r2, #11 // String length
    mov r7, #4 // Write
    svc 0

    // Exit
    mov r0, #0 // Exit code
    mov r7, #1 // Exit system call
    svc 0
     
