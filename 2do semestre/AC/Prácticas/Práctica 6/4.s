.data
msj: .asciiz "Ingrese un caracter: "
msjOtro: .asciiz "Ingrese otro caracter: "
bnv: .asciiz "Bienvenido"
err: .asciiz "Error"
clave: .asciiz "juegodelaoca"
control: .word32 0x10000
data: .word32 0x10008
ingreso: .asciiz ""
.text
lwu $a0, control($zero)
lwu $a1, data($zero)
daddi $a2, $zero, msj

dadd $s0, $zero, $zero
daddi $s1, $zero, 12
loopIngreso: jal char
sb $v0, ingreso($s0)
daddi $a2, $zero, msjOtro
daddi $s0, $s0, 1
daddi $s1, $s1, -1
bnez $s1, loopIngreso

dadd $t0, $zero, $zero
daddi $t3, $zero, 1
loopClave: lbu $t1, clave($t0)
beqz $t1, finCmp
lbu $t2, ingreso($t0)
bne $t1, $t2, noSonIguales
daddi $t0, $t0, 1
j loopClave

noSonIguales: dadd $t3, $zero, $zero
finCmp: dadd $a2, $zero, $t3
jal respuesta
halt


char: daddi $t0, $zero, 6
sd $t0, 0($a0)

dadd $t0, $zero, $a2
sd $t0, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)

daddi $t0, $zero, 9
sd $t0, 0($a0)

lbu $t0, 0($a1)
dadd $v0, $zero, $t0
jr $ra


respuesta: beqz $a2, diferentes
daddi $t0, $zero, bnv
j imprimir
diferentes: daddi $t0, $zero, err

imprimir: sd $t0, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)
jr $ra