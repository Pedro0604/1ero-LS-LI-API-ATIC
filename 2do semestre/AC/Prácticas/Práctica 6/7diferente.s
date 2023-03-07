.data
msj: .asciiz "Ingrese un caracter: "
msjEspera: .asciiz "Ingrese enter para continuar: "
salto: .byte 0xa
caracter: .word 0x00110a040a110000
cero: .word 0x0e11191513110e
uno: .word 0x04040404040c04
dos: .word 0x1f100c0201011e
tres: .word 0x1e01010e01011e
cuatro: .word 0x0101010f111111
cinco: .word 0x1e01011e10101f
seis: .word 0x0e11111e10100e
siete: .word 0x0404040402011f
ocho: .word 0x0e11110e11110e
nueve: .word 0x1e01010e11110e
a: .word 0x11111f11110a04
b: .word 0x1E11111E11111E
c: .word 0x0E11101010110E
admiracion: .word 0x04000404040404
corazon: .word 0x040A11150A0000
negro: .byte 0, 0, 0, 0
control: .word32 0x10000
data: .word32 0x10008

.text
lwu $s0, control($zero)
lwu $s1, data($zero)

loop: daddi $a0, $zero, msj
jal ingreso

dadd $a0, $zero, $v0
jal muestra

loopEnter: daddi $t0, $zero, 6
sd $t0, 0($t8)

daddi $t0, $zero, msjEspera
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

daddi $t0, $zero, 9
sd $t0, 0($s0)

lbu $t0, 0($s1)

daddi $t1, $zero, 13
bne $t0, $t1, loopEnter

daddi $t0, $zero, 6
sd $t0, 0($s0)
daddi $t0, $zero, 7
sd $t0, 0($t8)
j loop
halt



ingreso: lwu $t8, control($zero)
lwu $t9, data($zero)

sd $a0, 0($t9)

daddi $t0, $zero, 4
sd $t0, 0($t8)

daddi $t0, $zero, 9
sd $t0, 0($t8)

ld $t0, 0($t9)

finIngreso: dadd $v0, $zero, $t0
jr $ra



muestra: lwu $t8, control($zero)
lwu $t9, data($zero)

daddi $t0, $zero, 0x30
beq $a0, $t0, esCero
daddi $t0, $zero, 0x31
beq $a0, $t0, esUno
daddi $t0, $zero, 0x32
beq $a0, $t0, esDos
daddi $t0, $zero, 0x33
beq $a0, $t0, esTres
daddi $t0, $zero, 0x34
beq $a0, $t0, esCuatro
daddi $t0, $zero, 0x35
beq $a0, $t0, esCinco
daddi $t0, $zero, 0x36
beq $a0, $t0, esSeis
daddi $t0, $zero, 0x37
beq $a0, $t0, esSiete
daddi $t0, $zero, 0x38
beq $a0, $t0, esOcho
daddi $t0, $zero, 0x39
beq $a0, $t0, esNueve
daddi $t0, $zero, 0x41
beq $a0, $t0, esA
daddi $t0, $zero, 0x61
beq $a0, $t0, esA
daddi $t0, $zero, 0x41
beq $a0, $t0, esB
daddi $t0, $zero, 0x62
beq $a0, $t0, esB
daddi $t0, $zero, 0x43
beq $a0, $t0, esC
daddi $t0, $zero, 0x63
beq $a0, $t0, esC
daddi $t0, $zero, 0x21
beq $a0, $t0, esAdmiracion
daddi $t0, $zero, 0x40
beq $a0, $t0, esCorazon

daddi $t7, $zero, 0
j grafico

esCero: daddi $t7, $zero, 8
j grafico

esUno: daddi $t7, $zero, 16
j grafico

esDos: daddi $t7, $zero, 24
j grafico

esTres: daddi $t7, $zero, 32
j grafico

esCuatro: daddi $t7, $zero, 40
j grafico

esCinco: daddi $t7, $zero, 48
j grafico

esSeis: daddi $t7, $zero, 56
j grafico

esSiete: daddi $t7, $zero, 64
j grafico

esOcho: daddi $t7, $zero, 72
j grafico

esNueve: daddi $t7, $zero, 80
j grafico

esA: daddi $t7, $zero, 88
j grafico

esB: daddi $t7, $zero, 96
j grafico

esC: daddi $t7, $zero, 104
j grafico

esAdmiracion: daddi $t7, $zero, 112
j grafico

esCorazon: daddi $t7, $zero, 120


grafico: daddi $t0, $zero, 7
sd $t0, 0($t8)
daddi $t0, $zero, 6
sd $t0, 0($t8)

lwu $t0, negro($zero)
sw $t0, 0($t9)
daddi $t1, $zero, 7

loopFila: sb $t1, 4($t9)
lb $t6, caracter($t7)
daddi $t2, $zero, 5
daddi $t3, $zero, 1

loopColumna: sb $t2, 5($t9)
and $t4, $t6, $t3

bnez $t4, pintar
j finLoopColumna

pintar: daddi $t0, $zero, 5
sd $t0, 0($t8)

finLoopColumna: dsll $t3, $t3, 1
daddi $t2, $t2, -1
bnez $t2, loopColumna

daddi $t7, $t7, 1
daddi $t1, $t1, -1
bnez $t1, loopFila

finGraficar: jr $ra