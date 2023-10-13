.data
x: .quad 0xBAAAAAAAAAAAAAAD

.text
.global main
main:
    xorq %rax, %rax
    movq $64, %rcx
    movq x, %rdx

pop_count:
    rorq $1, %rdx
    adcb $0, %al
    loop pop_count

    ret

