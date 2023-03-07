.data
tabla: .word 2,3,3,46,5,2,3,4,3,22,20,0
cant: .word 0
.code
daddi $a0, $zero, tabla
daddi $sp, $zero, 0x400
jal tablaImpar
sd $v0, cant($zero)
halt

tablaImpar: daddi $sp, $sp, -8
sd $ra, 0($sp)
dadd $s0, $zero, $zero
dadd $s1, $zero, $a0

loopTablaImpar: ld $a0, 0($s1)
daddi $s1, $s1, 8
beqz $a0, finTablaImpar
jal esImpar
dadd $s0, $s0, $v0
j loopTablaImpar

finTablaImpar: dadd $v0, $zero, $s0
ld $ra, 0($sp)
daddi $sp, $sp, 8
jr $ra


esImpar: dadd $v0, $zero, $zero
andi $a0, $a0, 1
beqz $a0, finEsImpar
daddi $v0, $zero, 1
finEsImpar: jr $ra