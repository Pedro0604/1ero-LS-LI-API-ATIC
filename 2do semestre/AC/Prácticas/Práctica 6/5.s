.data
msjBase: .asciiz "Ingrese la base (double): "
msjExp: .asciiz "Ingrese un exponente (entero sin signo): "
msjRes1: .asciiz "El resultado de hacer "
msjRes2: .asciiz "elevado a "
msjRes3: .asciiz "es: "
control: .word32 0x10000
data: .word32 0x10008
.text
lwu $s0, control($zero)
lwu $s1, data($zero)

# Imprime el msjBase
daddi $t0, $zero, msjBase
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

# Espera que se ingrese un double
daddi $t0, $zero, 8
sd $t0, 0($s0)

# Se guarda la base en f0
l.d f0, 0($s1)

# Imprime el msjExp
daddi $t0, $zero, msjExp
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

# Espera que se ingrese un entero sin signo
daddi $t0, $zero, 8
sd $t0, 0($s0)

# Se guarda el expónente en $s2
ld $s2, 0($s1)

# Se copia el exponente en $a0
dadd $a0, $zero, $s2


jal aLaPotencia


# Imprime el msjRes1
daddi $t0, $zero, msjRes1
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

# Imprime la base
s.d f0, 0($s1)

daddi $t0, $zero, 3
sd $t0, 0($s0)

# Imprime el msjRes2
daddi $t0, $zero, msjRes2
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

# Imprime el exponente
sd $s2, 0($s1)

daddi $t0, $zero, 1
sd $t0, 0($s0)

# Imprime el msjRes3
daddi $t0, $zero, msjRes3
sd $t0, 0($s1)

daddi $t0, $zero, 4
sd $t0, 0($s0)

# Imprime el resultado
s.d f1, 0($s1)

daddi $t0, $zero, 3
sd $t0, 0($s0)

halt

aLaPotencia: daddi $t0, $zero, 1
mtc1 $t0, f1
cvt.d.l f1, f1 
loop: beqz $a0, finALaPotencia
mul.d f1, f1, f0
daddi $a0, $a0, -1
j loop
finALaPotencia: jr $ra