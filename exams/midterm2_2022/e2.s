.data
b:      .float 2.3
fmt:    .asciz "El valor escalado es %f\n"

.text
.global main
main:
    push %rbp
    movq %rsp, %rbp

    movq 8(%rsi), %rdi
    call atoi

    movl %eax, %edi
    movss b, %xmm0
    call scale

    movq %rbp, %rsp
    pop %rbp
    ret

scale:
    push %rbp
    movq %rsp, %rbp

    movl $8, %eax

    cvtsi2ss %rdi, %xmm1
    mulss %xmm1, %xmm0

    cvtsi2ss %rax, %xmm1
    addss %xmm1, %xmm0

    cvtss2sd %xmm0, %xmm0

    call imprime

    movq %rbp, %rsp
    pop %rbp
    ret

imprime:
    push %rbp
    movq %rsp, %rbp

    leaq fmt, %rdi
    movq $1, %rax
    call printf

    xorq %rax, %rax

    movq %rbp, %rsp
    pop %rbp
    ret

