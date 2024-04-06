.global fact1
fact1:
    pushq %rbp
    movq %rsp, %rbp

    cmpq $1, %rdi
    jbe fact1_base_case

    pushq %rdi
    decq %rdi
    call fact1
    popq %rdi
    mulq %rdi
    
    jmp end

fact1_base_case:
    movq %rdi, %rax

    jmp end

end:
    movq %rbp, %rsp
    popq %rbp

    ret

.global fact2
fact2:
    pushq %rbp
    movq %rsp, %rbp

    movq %rdi, %rcx
    movq $1, %rax
    
fact2_loop:
    mulq %rcx
    decq %rcx
    cmpq $1, %rcx
    ja fact2_loop

    movq %rbp, %rsp
    popq %rbp

    ret

