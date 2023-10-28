.data
count:  .long 5
format: .asciz "%d\n"

.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp

    call fun
    movl %eax, %esi
    leaq format, %rdi
    xorq %rax, %rax
    call printf 

    call fun
    movl %eax, %esi
    leaq format, %rdi
    xorq %rax, %rax
    call printf 

    xorq %rax, %rax

    movq %rbp, %rsp
    popq %rbp
    ret

fun:
    pushq %rbp
    movq %rsp, %rbp

    movl count, %eax
    incl %eax
    movl %eax, count
    
    movq %rbp, %rsp
    popq %rbp
    ret

