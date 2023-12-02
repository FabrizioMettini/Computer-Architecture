@ Problem Set 04 - Exercise 11

.text
.global determinant
determinant:
    vmul.f32 s0, s0, s3
    vmul.f32 s1, s1, s2
    vsub.f32 s0, s0, s1
    bx lr

