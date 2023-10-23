.data
x: .double 1.5

.text
.global convert
convert:
    movsd x, %xmm1
    mulsd %xmm1, %xmm0
    cvtsi2sd %rdi, %xmm2
    addsd %xmm2, %xmm0
    ret

