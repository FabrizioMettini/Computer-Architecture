@ Problem Set 04 - Exercise 04

.text
.global main
main:
    @ a) 
    mov r7, #0x8c, 4        @ r7 = 0xc0000008

    @ b) 
    mov r7, #0x42, 30       @ r7 = 0x108

    @ c) 
    mvn r7, #2              @ r7 = 0xfffffffd = -3
    
    @ d) 
    mvn r7, #0x8c, 4        @ r7 = 0x3ffffff7

    bx lr

