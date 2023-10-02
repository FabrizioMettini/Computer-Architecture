.text
.global main
main:
    movl $-1, %eax
    movl $2, %ecx
    imull %ecx

    shlq $32, %rdx
    orq %rdx, %rax

    xorq %rax, %rax
    movw $-1, %ax
    movw $2, %cx 
    mulw %cx  

    shll $16, %edx
    orl %edx, %eax
    
    ret
