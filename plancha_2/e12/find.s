# int find(const char* s, char c, unsigned l):

# Given a string s, its length l, and a character c, returns the index of the first aparition of c in s. 
# If c is not in s, return -1.

# .data
# str: .asciz "123a56"
# 
# .text
# .global main
# main:
#     movq $str, %rdi
#     movb $'a', %sil
#     movl $6, %edx
 
.global find
find:
    cld
    movb %sil, %al
    movl %edx, %ecx

    repne scasb
    je found

    movl $-1, %eax
    jmp end

found:
    subl %ecx, %edx
    dec %edx
    movl %edx, %eax

end:
    ret

