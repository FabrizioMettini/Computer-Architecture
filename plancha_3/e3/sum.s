.global sum
sum:
    xorq %rcx, %rcx

    sum_loop:
        movss (%rdi, %rcx, 4), %xmm0
        movss (%rsi, %rcx, 4), %xmm1
        addss %xmm1, %xmm0
        movss %xmm0, (%rdi, %rcx, 4)

        incl %ecx
        cmpl %edx, %ecx
        jl sum_loop

