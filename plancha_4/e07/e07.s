@ Problem Set 04 - Exercise 07

.text
.global main
main:
    mov r7, #42
    mov r12, #316

    @ a) add r3, r7, #1023          @ immediate value too big
    mov r1, #1
    rsb r1, r1, r1, lsl #10         @ r1 = 2^10 - 1 = 1023
    add r3, r7, r1                  @ r3 = r7 + 1023

    @ b) sub r11, r12, r3, lsl #32  @ shift value too big
    mov r3, #0                      @ also, left shifting a 32 bits value makes it equals to 0
    mov r11, r12                    @ r11 = r12, r12 = r12 - 0 = r12 - r3

    mov r0, #0
    bx lr

