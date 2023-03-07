.data
msj: .asciiz "Ingrese un numero entero de un dígito: "
msjOtro: .asciiz "Ingrese otro numero entero de un dígito: "
err: .asciiz "El caracter que ingreso no es un dígito."
resul: .asciiz "El resultado de la suma es: "
salto: .word 0xa
control: .word32 0x10000
data: .word32 0x10008

.text
lwu $a0, control($zero)
lwu $a1, data($zero)
loop: daddi $a2, $zero, msj
daddi $a3, $zero, err
jal ingreso
dadd $s0, $zero, $v0

daddi $t1, $zero, salto
sd $t1, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)

daddi $a2, $zero, msjOtro
jal ingreso
dadd $a3, $zero, $v0

dadd $a2, $zero, $s0
jal resultado

daddi $t0, $zero, 9
sd $t0, 0($a0)
daddi $t0, $zero, 6
sd $t0, 0($a0)
j loop
halt


ingreso: sd $a2, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)

daddi $t0, $zero, 9
sd $t0, 0($a0)

ld $t0, 0($a1)
slti $t1, $t0, 0x30
bnez $t1, noEsDigito
slti $t1, $t0, 0x3a
beqz $t1, noEsDigito
j finIngreso

noEsDigito: daddi $t0, $zero, 6
sd $t0, 0($a0)

sd $a3, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)

daddi $t1, $zero, salto
sd $t1, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)
j ingreso

finIngreso: dadd $v0, $zero, $t0
jr $ra


resultado: daddi $t1, $zero, salto
sd $t1, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)
daddi $t0, $zero, resul
sd $t0, 0($a1)

daddi $t0, $zero, 4
sd $t0, 0($a0)

daddi $a2, $a2, -0x30
daddi $a3, $a3, -0x30
dadd $t0, $a2, $a3
sd $t0, 0($a1)

daddi $t0, $zero, 1
sd $t0, 0($a0)

jr $ra