# Problem Set 03 - Exercise 04

# void sum_simd(float *a, float *b, int len);

# Sum two arrays a and b of length len using SIMD instructions. The result is in array a.

.global sum_simd
sum_simd:
    movl %edx, %eax                 # eax = len
    xorq %rdx, %rdx                 # clean edx to make the division

    movl $4, %r8d                   # r8d = 4
    divl %r8d                       # edx = len % 8, eax = len / 8

    xorl %ecx, %ecx                 # i = 0
    cmpl $0, %eax                   # len / 8 == 0 ?
    je scalar_sum_loop              # if true, we won't do any simd instructions

packed_sum_loop:
    movaps (%rdi), %xmm0            # xmm0 = a[i+3]          | a[i+2]          | a[i+1]          | a[i]
    movaps (%rsi), %xmm1            # xmm1 = b[i+3]          | b[i+2]          | b[i+1]          | b[i]
    addps %xmm1, %xmm0              # xmm0 = a[i+3] + b[i+3] | a[i+2] + b[i+2] | a[i+1] + b[i+1] | a[i] + b[i]
    movaps %xmm0, (%rdi)            # a[j] = a[j] + b[j], j := i..i+3

    addq $16, %rdi                  # a = a + 16
    addq $16, %rsi                  # b = b + 16

    incl %ecx                       # i++
    cmpl %eax, %ecx                 # i < len / 8 ?
    jl packed_sum_loop              # if true, go to new iteration

    xorl %ecx, %ecx                 # i = 0
    cmpl $0, %edx                   # len % 8 == 0?
    je end                          # if true, we won't do any scalar instructions

scalar_sum_loop:
    movss (%rdi, %rcx, 4), %xmm0    # xmm0 = a[i]
    movss (%rsi, %rcx, 4), %xmm1    # xmm1 = b[i]
    addss %xmm1, %xmm0              # xmm0 = a[i] + b[i]
    movss %xmm0, (%rdi, %rcx, 4)    # a[i] = a[i] + b[i]

    incl %ecx                       # i++
    cmpl %edx, %ecx                 # i < len ?
    jl scalar_sum_loop              # if true, go to new iteration
    
end:
    xorl %eax, %eax                 # return value is 0
    ret
