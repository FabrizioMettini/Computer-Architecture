.data
array: .word 0xaabbccdd, 5, 7, 9

.text
.global main
main:
    ldr r3, =array
    ldr r5, =0x11223344
    ldrh r5, [r3], #8   @ r5 = 0xccdd and r3 = array + 8

    bx lr
