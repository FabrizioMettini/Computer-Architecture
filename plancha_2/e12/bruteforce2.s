# implement the bruteforce2 function in x86_64 (see bruteforce2.c)

.text
.global bruteforce2
bruteforce2:
    pushq %rbp
    movq %rsp, %rbp

    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    movq %rdi, %r12
    movq %rsi, %r13
    movl %edx, %r14d
    movl %ecx, %r15d

    subq $16, %rsp
    movl $0, 8(%rsp)
    movl $0, 4(%rsp)

    movl %r14d, %edx
    subl %r15d, %edx
    incl %edx

    cmpl %edx, 8(%rsp)
    jge not_found

iter:
    movq %r12, %rdi
    movl 8(%rsp), %r8d
    addq %r8, %rdi
    movb (%r13), %sil
    movl %r14d, %edx
    subl 8(%rsp), %edx
    call find

    movl %eax, 4(%rsp)
    cmpl $-1, 4(%rsp)
    je not_found

    movq %r12, %rdi
    movl 8(%rsp), %r8d
    addq %r8, %rdi
    movl 4(%rsp), %r8d
    addq %r8, %rdi
    movq %r13, %rsi
    movl %r15d, %edx
    call compare

    cmpl $0, %eax
    je not_equal_first_l

equal_first_l:
    movl 8(%rsp), %eax
    addl 4(%rsp), %eax
    jmp end

not_equal_first_l:
    addl 4(%rsp), %r8d
    incl %r8d
    movl %r8d, 8(%rsp)
    
    movl %r14d, %edx
    subl %r15d, %edx
    incl %edx

    cmpl %edx, 8(%rsp)
    jl iter

not_found:
    movl $-1, %eax

end:
    popq %r15
    popq %r14
    popq %r13
    popq %r12

    movq %rbp, %rsp
    popq %rbp

    ret
