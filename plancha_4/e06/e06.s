@ Problem Set 04 - Exercise 06

.text
.global main
main:
    @ a) 
    mov r0, #0xc0000034     @ 0xc0000034 = 0xd3 ror 2

    @ b) 
    ldr r0, =0x12340000     @ immediate value is too big

    @ c) 
    ldr r0, =0x77777777     @ immediate value is too big

    @ d) 
    mvn r0, #0              @ 0xffffffff = not 0x0

    @ e) 
    mvn r0, #1              @ 0xfffffffe = not 0x1

    bx lr

