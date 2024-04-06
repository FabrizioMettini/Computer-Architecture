.data
x: .quad 0xBAAAAAAAAAAAAAAD

.text
.global main
main:
    movq x, %rax
    movq %rax, %rdx
    xorq %rax, %rax
    movq $64, %rcx

pop_count:
    rorq $1, %rdx
    adcb $0, %al
    loop pop_count

    ret

