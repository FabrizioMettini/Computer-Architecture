@ Problem Set 04 - Exercise 01

@ Equivalent C Code:
@ a) x = array[7] + y
@ b) array[9] = array[8] + y

@ Register Usage:
@ r0: x
@ r1: y
@ r2: array
@ r3: aux

@ Data Segment
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
x: .word 2
y: .word 7

@ Text Segment
.text
.global main
main:
    ldr r0, =x              @ load address of x in r0
    ldr r0, [r0]            @ load value of x in r0
    ldr r1, =y              @ load address of y in r1
    ldr r1, [r1]            @ load value of y in r1
    ldr r2, =array          @ load address of array in r2

    @ a)
    ldr r3, [r2, #28]       @ load value array[7] in r3
    add r0, r3, r1          @ x = array[7] + y

    @ b)
    ldr r3, [r2, #32]       @ load value array[8] in r3
    add r3, r1              @ aux = aux + y
    str r3, [r2, #36]       @ array[9] = aux

    mov r0, #0              @ make return value equals 0
    bx lr                   @ return

