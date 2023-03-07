.data
cadena: .asciiz "Hola me llamo Pedro y soy re crack."
cant: .word 0
vocales: .asciiz "aeiouAEIOU"
.code
daddi $a0, $zero, cadena
daddi $a1, $zero, vocales
daddi $sp, $zero, 0x400
jal contarVoc
sd $v0, cant($zero)
halt


contarVoc: dadd $s0, $zero, $zero
daddi $sp, $sp, -8
sd $ra, 0($sp)
dadd $s1, $zero, $a0
dadd $s2, $zero, $a1

loopContarVoc: lbu $a0, 0($s1)
dadd $a1, $zero, $s2
beqz $a0, finContarVoc
daddi $s1, $s1, 1
jal esVocal
dadd $s0, $s0, $v0
j loopContarVoc

finContarVoc: dadd $v0, $zero, $s0
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra


esVocal: dadd $v0, $zero, $zero
loopEsVoc: lbu $t0, 0($a1)
daddi $a1, $a1, 1
beqz $t0, finEsVoc
bne $t0, $a0, loopEsVoc
esV: daddi $v0, $zero, 1
finEsVoc: jr $ra