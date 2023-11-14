@ Problem Set 04 - Exercise 05

.text
.global main
main:    
    @ a) 
    mov r2, #0xa400         @ 0xa400 = 0x29 ror 22
    
    @ b) 
    mov r2, #0x3d8          @ 0x3d8 = 0xf6 ror 30

    @ c) 
    mov r2, #0x17400        @ 0x17400 = 0x5d ror 22

    @ d) 
    mov r2, #0x1980         @ 0x1980 = 0x66 ror 26

    bx lr

