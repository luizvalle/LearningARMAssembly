.include "fileio.s"

.equ BUFFER_SIZE, 250

.global _start
_start:
    // Open input file
    openFile in_file, O_RDONLY
    movs r8, r0 // Save file descriptor and set flags
    bpl success // Function did not return an error code (non-negative)

    // If we reach this, then an error was returned
    mov r0, #1 // stdout
    ldr r2, =in_err_size
    ldr r2, [r2]
    writeFile r0, in_err, r2
    flushClose r8
    b exit

success:
    // Open output file
    openFile out_file, O_CREAT+O_WRONLY
    mov r9, r0 // Save file descriptor
    bpl loop

    mov r0, #1 // stdout
    ldr r2, =out_err_size
    ldr r2, [r2]
    writeFile r0, out_err, r2
    b exit

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

exit:
    // Exit
    mov r7, #1
    mov r0, #0
    svc 0

.data

in_file: .asciz "main.s"
out_file: .asciz "output.txt"
in_buffer: .fill BUFFER_SIZE + 1, 1, 0
out_buffer: .fill BUFFER_SIZE + 1, 1, 0
in_err: .asciz "Error opening the input file.\n"
// . is a special GNU variable representing the current address the assembler is on
in_err_size: .word .-in_err 
out_err: .asciz "Error opening the ouput file.\n"
out_err_size: .word .-out_err
