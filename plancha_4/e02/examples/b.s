.data
array: .word 2, 5, 7, 9

.text
.global main
main:
    ldr r3, =array
    ldr r7, =0xaabbccdd
    strb r7, [r3], #4
    @ now array = [0xdd, 5, 7, 9] and r3 = array + 4

    bx lr

