.data
array: .word 2, 5, 7, 9

.text
.global main
main:
    ldr r3, =array
    ldr r6, =0xaabbccdd
    str r6, [r3, #12]
    @ now array = [2, 5, 7, 0xaabbccdd] and r3 = array

    bx lr

