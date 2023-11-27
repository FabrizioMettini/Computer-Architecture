.text
square:
    movl %edi, %eax
    imull %eax
    ret

.global sum_squares
sum_squares:
    pushq %rbp
    movq %rsp, %rbp

    pushq %rbx
    pushq %r12

    addq $8, %rsi
    movq %rsi, %rbx     
    decl %edi
    movl %edi, %r12d

    subq $16, %rsp
    movl $0, 8(%rsp)
    movl $0, 4(%rsp)

iter:
    movl 4(%rsp), %ecx
    movq (%rbx, %rcx, 8), %rdi
    call atoi

    movl %eax, %edi
    call square
    
    addl %eax, 8(%rsp)

    incl 4(%rsp)
    cmpl %r12d, 4(%rsp)
    jl iter

end:
    movl 8(%rsp), %eax
    addq $16, %rsp

    popq %r12
    popq %rbx

    movq %rbp, %rsp
    popq %rbp

    ret

