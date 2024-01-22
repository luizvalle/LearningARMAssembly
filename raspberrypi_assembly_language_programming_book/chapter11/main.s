.include "utils.s"

.equ USAGE_STR_SIZE, 38 // Size of usage_str

.global _start
_start:
    ldr r0, [sp] // r0 = argc
    cmp r0, #5 // Program name + 4 points
    beq correct_argc
    print usage_str USAGE_STR_SIZE
    exit 1
correct_argc:
    ldmib sp, {r4-r8} // Load all argv elements
    mov r0, r5 // r0 = argv[1]
    bl strtof
    mov r4, r0
    mov r0, r6
    bl strtof
    mov r5, r0
    mov r0, r7
    bl strtof
    mov r6, r0
    mov r0, r8
    bl strtof
    mov r7, r0
    exit 0

.data
usage_str: .ascii "Usage: ./distance <x1> <y1> <x2> <y2>\n"
.align 4
