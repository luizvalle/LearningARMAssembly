// Program to print "Hello World!\n" to stdout.
//
// r0-r2 - parameters to linux function services
// r7 - linux function
//
.data

helloworld: .ascii "Hello, Luiz, I am a program!\n"

.text

.global _start // Provide program starting address to the linker
_start:
    // Print
    mov r0, #1 // Stdout = 1
    ldr r1, =helloworld // String to print
    mov r2, #29 // String length
    mov r7, #4 // Linux system call to write call
    svc 0 // Call write system call

    // Exit
    mov r0, #257 // Successful exit code
    mov r7, #1 // System call to exit
    svc 0 // Call exit system call

