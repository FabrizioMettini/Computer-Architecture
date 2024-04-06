.data
x: .quad 0x11223344AABBCCDD

.text
.global main
main:
    movq x, %rax
    rolq $32, %rax
    ret

