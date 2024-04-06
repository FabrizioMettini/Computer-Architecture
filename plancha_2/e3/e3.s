.data
N1: .byte 100   # 0b01100100 = 0x64
N2: .byte 120   # 0b01111000 = 0x78
N3: .byte -63   # 0b11000001 = 0xc1
N4: .byte -56   # 0b11001000 = 0xc8
N5: .byte -91   # 0b10100101 = 0xa5

.text
.global main
main:
    movb N1, %al
    movb N2, %bl
    addb %bl, %al 
    
    # al = -36 = 0b11011100 = 0xdc
    # CF = 0
    # OF = 1

    movb N3, %al
    movb N4, %bl
    addb %bl, %al

    # al = -119 = 0b10001001
    # CF = 1
    # OF = 0

    movb N3, %al
    movb N5, %bl
    addb %bl, %al

    # al = 102 = 0b1100110 = 0x66
    # CF = 1
    # OF = 1

    movb N2, %al
    movb N4, %bl
    subb %bl, %al

    # al = -80 = 0b10110000 = 0xb0
    # CF = 1
    # OF = 1

    movb N5, %al
    movb N2, %bl
    subb %bl, %al

    # al = 45 = 00101101 = 0x2d
    # CF = 0
    # OF = 1
