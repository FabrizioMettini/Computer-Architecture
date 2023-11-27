# int compare(const char *s1, const char *s2, unsigned l)

# Given a string s1, a shorter string s2 and the length of s2, return if s1 and s2 are equal for the first l chars.

# .data
# s1: .asciz "123456"
# s2: .asciz "124"
# l: .long 2
# 
# .text
# .global main
# main:
#     leaq s1, %rdi
#     leaq s2, %rsi
#     movl l, %edx
 
.global compare
compare:
    cld                 
    movl %edx, %ecx

    repe cmpsb
    je equals

    movl $0, %eax
    jmp end             

equals:
    movl $1, %eax

end:
    ret

