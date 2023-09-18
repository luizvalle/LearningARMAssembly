// Macros to perform file I/O

.include "unistd.s"

.equ O_RDONLY, 0
.equ O_WRONLY, 1
.equ O_CREAT, 0100
.equ S_RDWR, 0666

.macro openFile fileName, flags
    ldr r0, =\fileName
    mov r1, #\flags
    mov r2, #S_RDWR // RW access
    mov r7, #sys_open
    svc 0
.endm
.macro readFile fd, buffer, length
    mov r0, \fd
    ldr r1, =\buffer
    mov r2, #\length
    mov r7, #sys_read
    svc 0
.endm
.macro writeFile fd, buffer, length
    mov r0, \fd
    ldr r1, =\buffer
    mov r2, \length
    mov r7, #sys_write
    svc 0
.endm
.macro flushClose fd
// fsync call
    mov r0, \fd
    mov r7, #sys_fsync
    svc 0
// close call
    mov r0, \fd
    mov r7, #sys_close
    svc 0
.endm
