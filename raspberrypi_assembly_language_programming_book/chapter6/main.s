.text

.global _start
_start:
    // Call to upper: to_upper(str_in, str_out)
    ldr r0, =str_in
    ldr r1, =str_out
    bl to_upper

    mov r2, r0 // Function should return string size
    mov r0, #1
    ldr r1, =str_out
    mov r7, #4
    svc 0

    mov r0, #0
    mov r7, #1
    svc 0
    
.data

str_in: .asciz "My name is Luiz, and this is my assEmbly program to capitalize letters! Today is September 3rd 2023.\n"
str_out: .fill 255, 1, 0
