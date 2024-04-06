.data
array: .long 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
size: .byte 10
format: .asciz "%d\n"

.text
.global main
main:
    # call sum
    leaq array, %rdi
    movb size, %sil
    call sum

    # print sum
    leaq format, %rdi
    movl %eax, %esi
    xorq %rax, %rax
    call printf

    # call maximum
    leaq array, %rdi
    movb size, %sil
    call maximum

    # print maximum
    leaq format, %rdi
    movl %eax, %esi
    xorq %rax, %rax
    call printf

    # call minimum
    leaq array, %rdi
    movb size, %sil
    call minimum
 
    # print minimum
    leaq format, %rdi
    movl %eax, %esi
    xorq %rax, %rax
    call printf
 
    # call mean
    leaq array, %rdi
    movb size, %sil
    call mean

    # print mean
    leaq format, %rdi
    movl %eax, %esi
    xorq %rax, %rax
    call printf
 
    ret

sum:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    
    xorq %rax, %rax  # accumulator
    xorq %rcx, %rcx  # index

sum_loop:
    addl (%rdi, %rcx, 4), %eax
    incq %rcx
    cmpb %sil, %cl
    jnz sum_loop

    # epilogue
    movq %rbp, %rsp
    popq %rbp

    ret

maximum:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    
    xorq %rax, %rax  # maximum
    xorq %rcx, %rcx  # index

maximum_loop:
    cmpl (%rdi, %rcx, 4), %eax
    cmovl (%rdi, %rcx, 4), %eax
    incq %rcx
    cmpb %sil, %cl
    jnz maximum_loop

    # epilogue
    movq %rbp, %rsp
    popq %rbp

    ret

minimum:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    
    movl $0x7FFFFFFF, %eax  # minimum
    xorq %rcx, %rcx         # index

minimum_loop:
    cmpl (%rdi, %rcx, 4), %eax
    cmovg (%rdi, %rcx, 4), %eax
    incq %rcx
    cmpb %sil, %cl
    jnz minimum_loop

    # epilogue
    movq %rbp, %rsp
    popq %rbp

    ret

mean:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    
    call sum
    divb %sil

    # epilogue
    movq %rbp, %rsp
    popq %rbp

    ret

