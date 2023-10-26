.global sum_simd
sum_simd:
    pushq %rbp
    movq %rsp, %rbp

    movl %edx, %eax
    xorq %rdx, %rdx 

    movl $4, %r8d
    divl %r8d

    xorq %rcx, %rcx 

packed_sum_loop:
    movaps (%rdi), %xmm0
    movaps (%rsi), %xmm1
    addps %xmm1, %xmm0
    movaps %xmm0, (%rdi)

    addq $16, %rdi
    addq $16, %rsi

    incl %ecx
    cmpl %eax, %ecx
    jl packed_sum_loop

    cmpl $0, %edx
    je end

    xorq %rcx, %rcx 
    
scalar_sum_loop:
    movss (%rdi, %rcx, 4), %xmm0
    movss (%rsi, %rcx, 4), %xmm1
    addss %xmm1, %xmm0
    movss %xmm0, (%rdi, %rcx, 4)

    incl %ecx
    cmpl %edx, %ecx
    jl scalar_sum_loop
    
end:
    movq %rbp, %rsp
    popq %rbp
    ret

