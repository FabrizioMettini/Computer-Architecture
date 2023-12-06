# Problem Set 03 - Exercise 03

# void sum(float *a, float *b, int len);

# Sum two arrays a and b of length len. The result is in array a.

.global sum
sum:
    xorl %ecx, %ecx                 # i = 0

sum_loop:
    movss (%rdi, %rcx, 4), %xmm0    # xmm0 = a[i]
    movss (%rsi, %rcx, 4), %xmm1    # xmm1 = b[i]
    addss %xmm1, %xmm0              # xmm0 = a[i] + b[i]
    movss %xmm0, (%rdi, %rcx, 4)    # a[i] = a[i] + b[i]

    incl %ecx                       # i++
    cmpl %edx, %ecx                 # i < len ?
    jl sum_loop                     # if true, go to new iteration

    xorl %eax, %eax                 # return value is 0
    ret
