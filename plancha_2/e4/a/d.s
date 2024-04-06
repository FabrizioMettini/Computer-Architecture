.text
.global main
main:
    movl $0xAA, %eax
    sall $24, %eax
    movl $0xAA, %ebx
    orl %ebx, %eax
    ret
