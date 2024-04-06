.data
format: .asciz "%ld\n"
hex_format: .asciz "%x\n"
i: .quad 0xDEADBEEF

.text
.global main
main:
    # value of register rsp
    leaq format, %rdi 
    movq %rsp, %rsi 
    xorq %rax, %rax 
    call printf
    
    # address of format string
    leaq format, %rdi 
    leaq format, %rsi 
    xorq %rax, %rax 
    call printf
    
    # address of format string (in hexadecimal)
    leaq hex_format, %rdi 
    leaq format, %rsi 
    xorq %rax, %rax 
    call printf
    
    # value of the top element in the stack
    leaq format, %rdi 
    movq (%rsp), %rsi 
    xorq %rax, %rax 
    call printf
    
    # value in address rsp+8
    leaq format, %rdi 
    movq 8(%rsp), %rsi 
    xorq %rax, %rax 
    call printf
    
    # value of i
    leaq hex_format, %rdi 
    movq i, %rsi 
    xorq %rax, %rax 
    call printf
    
    # address of i
    leaq hex_format, %rdi 
    leaq i, %rsi 
    xorq %rax, %rax 
    call printf
    
    ret

