.data
caracter: .ascii "e"
es: .word 0
vocales: .asciiz "aeiouAEIOU"
.code
lbu $a0, caracter($zero)
daddi $a1, $zero, vocales
jal esVocal
sd $v0, es($zero)
halt

esVocal: dadd $v0, $zero, $zero
loop: lbu $t0, 0($a1)
daddi $a1, $a1, 1
beqz $t0, fin
bne $t0, $a0, loop
esV: daddi $v0, $zero, 1
fin: jr $ra