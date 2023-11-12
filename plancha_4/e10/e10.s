@ Problem Set 04 - Exercise 10

.text
.global nth_power_of_two
nth_power_of_two:
    mov r1, #1
    mov r1, r1, lsl r0
    mov r0, r1
    bx lr
    
