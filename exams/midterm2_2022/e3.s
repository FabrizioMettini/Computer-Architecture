.data
str:    .long 1,2,3,4
g:      .quad 0x1122334455667788
msg:    .asciz "Hola mundo"

.text
.global main
main:
    movl str, %eax
    movl str+4, %eax
    movb str+16, %al
    movq $3, %rbx
    movb str(,%rbx,4), %al
    leaq msg, %rax
    movb g(,%rbx,1), %al
    movl $0, %eax
    ret
