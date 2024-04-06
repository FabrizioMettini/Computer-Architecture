.text
.global main
main:
    movl $0x55, %eax
    sall $8, %eax
    ret
