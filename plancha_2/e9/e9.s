.data
array: .byte 1, 2, 3, 4, 5
size: .byte 5

.text
.global main
main:
    leaq array, %rdi
    movb size, %sil
    call reverse
    ret

reverse:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    
    xorq %rax, %rax
load:
    pushq (%rdi, %rax, 1)
    incq %rax
    cmpb %sil, %al
    jnz load

    xorq %rax, %rax
unload:
    popq (%rdi, %rax, 1)
    incq %rax
    cmpb %sil, %al
    jnz unload

    # epilogue
    movq %rbp, %rsp
    pop %rbp

    ret

