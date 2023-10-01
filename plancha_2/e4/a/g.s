.text
.global main
main:
    xorl %eax, %eax
    movl $1, %ebx
    subl %ebx, %eax
    ret
