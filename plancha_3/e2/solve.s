# Problem Set 03 - Exercise 02

# int solve(float a, float b, float c, float d, float e, float f, float *x, float *y);

# Solves the 2x2 linear system of equations
#   ax + by = c
#   dx + ey = f
# using the cramer's rule.

# returns 0 if the solution is unique, -1 otherwise.

.global solve
solve:
determinant:
    movss %xmm0, %xmm6      # copy a to xmm6
    movss %xmm1, %xmm7      # copy b to xmm7
    mulss %xmm4, %xmm6      # xmm6 = a * e
    mulss %xmm3, %xmm7      # xmm7 = b * d
    ucomiss %xmm7, %xmm6    # a * e == b * d ?
    je not_unique           # if true, then we don't have a unique solution

unique:
    subss %xmm7, %xmm6      # xmm6 = a*e - b*d

    movss %xmm2, %xmm7      # xmm7 = c
    mulss %xmm3, %xmm7      # xmm7 = c*d

    movss %xmm5, %xmm9      # xmm9 = f
    mulss %xmm0, %xmm9      # xmm9 = a*f

    subss %xmm7, %xmm9      # xmm9 = a*f - c*d

    movss %xmm2, %xmm7      # xmm7 = c
    mulss %xmm4, %xmm7      # xmm7 = c*e

    movss %xmm5, %xmm10     # xmm10 = f
    mulss %xmm1, %xmm10     # xmm10 = b*f

    subss %xmm10, %xmm7     # xmm7 = c*e - b*f
    
    divss %xmm6, %xmm7      # xmm7 = (c*e - b*f) / (a*e - b*d)
    divss %xmm6, %xmm9      # xmm9 = (a*f - c*d) / (a*e - b*d)

    movss %xmm7, (%rdi)     # *x = (c*e - b*f) / (a*e - b*d)
    movss %xmm9, (%rsi)     # *y = (a*f - c*d) / (a*e - b*d)

    xorl %eax, %eax         # return value = 0
    jmp end

not_unique:
    movq $-1, %rax          # return value = -1

end:
    ret
