# Problem Set 03 - Exercise 01

# double convert(double f, int c);
# returns f*1.5 + c;

.data
x: .double 1.5

.text
.global convert
convert:
    movsd x, %xmm1          # xmm1 = 1.5
    mulsd %xmm1, %xmm0      # xmm0 = f*1.5
    cvtsi2sd %rdi, %xmm2    # xmm2 = (double) c
    addsd %xmm2, %xmm0      # xmm0 = f*1.5 + (double) c
    ret
