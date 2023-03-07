.data
msj: .asciiz "Ingrese un numero entero de un dígito: "
err: .asciiz "El caracter que ingreso no es un dígito."
salto: .word 0xa
cero: .asciiz "cero"
uno: .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
cuatro: .asciiz "cuatro"
cinco: .asciiz "cinco"
seis: .asciiz "seis"
siete: .asciiz "siete"
ocho: .asciiz "ocho"
nueve: .asciiz "nueve"
control: .word32 0x10000
data: .word32 0x10008

.text
lwu $s0, control($zero)
daddi $a3, $zero, err
loop: daddi $a2, $zero, msj
jal ingreso
dadd $a2, $zero, $v0
jal muestra
daddi $t0, $zero, 9
sd $t0, 0($s0)
daddi $t0, $zero, 6
sd $t0, 0($s0)
j loop
halt


ingreso: lwu $t8, control($zero)
lwu $t9, data($zero)

sd $a2, 0($t9)

daddi $t0, $zero, 4
sd $t0, 0($t8)

daddi $t0, $zero, 9
sd $t0, 0($t8)

ld $t0, 0($t9)
slti $t1, $t0, 0x30
bnez $t1, noEsDigito
slti $t1, $t0, 0x3a
beqz $t1, noEsDigito
j finIngreso

noEsDigito: daddi $t0, $zero, 6
sd $t0, 0($t8)

sd $a3, 0($t9)

daddi $t0, $zero, 4
sd $t0, 0($t8)

daddi $t1, $zero, salto
sd $t1, 0($t9)

daddi $t0, $zero, 4
sd $t0, 0($t8)
j ingreso

finIngreso: dadd $v0, $zero, $t0
jr $ra


muestra: daddi $t0, $zero, 0x30
beq $a2, $t0, esCero
daddi $t0, $zero, 0x31
beq $a2, $t0, esUno
daddi $t0, $zero, 0x32
beq $a2, $t0, esDos
daddi $t0, $zero, 0x33
beq $a2, $t0, esTres
daddi $t0, $zero, 0x34
beq $a2, $t0, esCuatro
daddi $t0, $zero, 0x35
beq $a2, $t0, esCinco
daddi $t0, $zero, 0x36
beq $a2, $t0, esSeis
daddi $t0, $zero, 0x37
beq $a2, $t0, esSiete
daddi $t0, $zero, 0x38
beq $a2, $t0, esOcho
daddi $t0, $zero, 0x39
beq $a2, $t0, esNueve
esCero: daddi $t0, $zero, cero
sd $t0, 0($t9)
j imprimir
esUno: daddi $t0, $zero, uno
sd $t0, 0($t9)
j imprimir
esDos: daddi $t0, $zero, dos
sd $t0, 0($t9)
j imprimir
esTres: daddi $t0, $zero, tres
sd $t0, 0($t9)
j imprimir
esCuatro: daddi $t0, $zero, cuatro
sd $t0, 0($t9)
j imprimir
esCinco: daddi $t0, $zero, cinco
sd $t0, 0($t9)
j imprimir
esSeis: daddi $t0, $zero, seis
sd $t0, 0($t9)
j imprimir
esSiete: daddi $t0, $zero, siete
sd $t0, 0($t9)
j imprimir
esOcho: daddi $t0, $zero, ocho
sd $t0, 0($t9)
j imprimir
esNueve: daddi $t0, $zero, nueve
sd $t0, 0($t9)

imprimir: daddi $t0, $zero, 4
sd $t0, 0($t8)
jr $ra