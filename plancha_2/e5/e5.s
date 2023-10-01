.text
.global main
main:
    movl $-1, %eax
    movl $2, %ecx
    imull %ecx

    movq $0xffffffff00000000, %rbx
    orq %rbx, %rax

    xorq %rax, %rax
    movw $-1, %ax
    movw $2, %cx 
    mulw %cx  

    movl $0x10000, %ebx
    orl %ebx, %eax
    
    ret
