.data
control: .word32 0x10000
data: .word32 0x10008
msj: .asciiz "Ingrese una cadena de caracteres: "
cadena: .ascii ""
.text
lwu $s6, control($zero)
lwu $s7, data($zero)
daddi $t0, $zero, msj
sd $t0, 0($s7)
daddi $t0, $zero, 4
sd $t0, 0($s6)
daddi $s0, $zero, 0
daddi $t1, $zero, 9
daddi $t3, $zero, 0x30

loopIngreso: sd $t1, 0($s6)
lbu $t2, 0($s7)
beq $t2, $t3, finIngreso
sb $t2, cadena($s0)
daddi $s0, $s0, 1
j loopIngreso
finIngreso: daddi $t2, $zero, 0
sb $t2, cadena($s0)

dadd $s2, $zero, $s0
daddi $s2, $s2, 1
dadd $s1, $zero, $s0
loopCrearCadenaInversa: daddi $s1, $s1, -1
daddi $s0, $s0, 1
lbu $t0, cadena($s1)
sb $t0, cadena($s0)
bnez $s1, loopCrearCadenaInversa
daddi $t0, $zero, 0
sb $t0, 0($s0)

daddi $t0, $zero, cadena
sd $t0, 0($s7)
daddi $t0, $zero, 4
sd $t0, 0($s6)

daddi $t0, $s2, cadena
sd $t0, 0($s7)
daddi $t0, $zero, 4
sd $t0, 0($s6)
halt