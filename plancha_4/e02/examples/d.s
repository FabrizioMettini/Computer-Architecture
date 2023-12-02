.data
array: .word 2, 5, 7, 0xaabbccdd

.text
.global main
main:
    ldr r3, =array
    ldr r12, [r3, #12]!     @ r12 = 0xaabbccdd and r3 = array + 12

    bx lr

