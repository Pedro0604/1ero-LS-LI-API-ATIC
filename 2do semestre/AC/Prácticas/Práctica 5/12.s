.data
valor: .word 20
resultado: .word 0
.code
daddi $sp, $zero, 0x400
ld $a0, valor($zero)
jal factorial
sd $v0, resultado($zero)
halt

factorial: daddi $sp, $sp, -16
sd $ra, 8($sp)
sd $s0, 0($sp)
dadd $s0, $zero, $a0
daddi $v0, $zero, 1
beqz $s0, finFactorial
daddi $a0, $s0, -1
jal factorial
dmul $v0, $v0, $s0
finFactorial: ld $s0, 0($sp)
ld $ra, 8($sp)
daddi $sp, $sp, 16
jr $ra