.data
msg_sum:   .asciz "Number of arguments: %d. The sum is %d.\n"
msg_error: .asciz "Enter at least one argument.\n"

.text
.global main
main:
    pushq %rbp
    movq %rsp, %rbp

    pushq %rbx
    pushq %r12

    movl %edi, %r12d
    decl %r12d

    cmpl $1, %edi
    je print_error

print_sum:
    call sum_squares

    leaq msg_sum, %rdi
    movl %r12d, %esi
    movl %eax, %edx
    xorl %eax, %eax
    call printf

    jmp end

print_error:
    leaq msg_error, %rdi
    xorl %eax, %eax
    call printf

end:
    popq %r12
    popq %rbx

    movq %rbp, %rsp
    popq %rbp

    xorl %eax, %eax
    ret

