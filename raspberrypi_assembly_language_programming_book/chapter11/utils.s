.macro print str_label size
    push {r0-r2}
    mov r0, #1 // stdout file descriptor
    ldr r1, =\str_label
    mov r2, #\size
    mov r7, #4 // write syscall
    svc 0
    pop {r0-r2}
.endm

.macro exit error_code
    mov r0, #\error_code
    mov r7, #1 // exit syscall
    svc 0
.endm
