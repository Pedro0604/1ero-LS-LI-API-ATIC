.data
control: .word32 0x10000
data: .word32 0x10008
coordX: .byte 20
coordY: .byte 10
color: .byte 0, 0, 0, 0
datos: .byte 25, 24, 21, 18, 16, 12, 10, 13, 15, 18, 22, 24
.text
lwu $s6, control($zero)
lwu $s7, data($zero)
daddi $t1, $zero, 12

dadd $t2, $zero, $zero

lwu $s2, color($zero)
sw $s2, 0($s7)
lb $s0, coordX($0)
daddi $t0, $zero, 5
lazo1: lb $t3, datos($t2)
lb $s1, coordY($0)
sb $s0, 5($s7)
lazo2: sb $s1, 4($s7)

sd $t0, 0($s6)

daddi $t3, $t3, -1
daddi $s1, $s1, 1
bnez $t3, lazo2
daddi $s0, $s0, 1
daddi $t2, $t2, 1

daddi $t1, $t1, -1

bnez $t1, lazo1
halt