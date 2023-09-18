.include "fileio.s"

.equ BUFFER_SIZE, 250

.global _start
_start:
    // Open input file
    openFile in_file, O_RDONLY
    mov r8, r0 // Save file descriptor

    // Open output file
    openFile out_file, O_CREAT+O_WRONLY
    mov r9, r0 // Save file descriptor

loop:
    // Read input file
    readFile r8, in_buffer, BUFFER_SIZE
    movs r10, r0 // Save num bytes read and set flags
    beq end_loop // Read 0 bytes

    // Null-terminate input for to_upper
    mov r6, #0
    ldr r5, =in_buffer
    strb r6, [r5, r10]

    // Call to_upper to capitalize
    ldr r0, =in_buffer
    ldr r1, =out_buffer
    bl to_upper

    // Write to output file
    writeFile r9, out_buffer, r10
    b loop

end_loop:
    // Close files
    flushClose r8
    flushClose r9

    // Exit
    mov r7, #1
    mov r0, #0
    svc 0

.data

in_file: .asciz "main.s"
out_file: .asciz "output.txt"
in_buffer: .fill BUFFER_SIZE + 1, 1, 0
out_buffer: .fill BUFFER_SIZE + 1, 1, 0
