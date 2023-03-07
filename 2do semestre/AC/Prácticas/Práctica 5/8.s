.data
cadena1: .asciiz "12345679"
cadena2: .asciiz "123456789"
resultado: .word 0
.code
daddi $a0, $zero, cadena1
daddi $a1, $zero, cadena2
jal subrutina
sd $v0, resultado($zero)
halt

subrutina: daddi $v0, $zero, -1
dadd $t0, $zero, $zero
loop: lbu $t1, 0($a0)
lbu $t2, 0($a1)
daddi $a0, $a0, 1
daddi $a1, $a1, 1
daddi $t0, $t0, 1
bne $t1, $t2, diferentes
bnez $t1, loop
j fin
diferentes: dadd $v0, $zero, $t0
fin: jr $ra