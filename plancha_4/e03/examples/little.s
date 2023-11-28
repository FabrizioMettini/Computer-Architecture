.data
a: .word 1

.text
.global main
main:
    setend le

    ldr r3, =a
    ldr r6, =0xBEEFFACE

    str r6, [r3]
    @ now a = 0xbeefface

    ldrb r4, [r3]
    @ r4 = 0xce

    bx lr

