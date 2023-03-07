.data
M: .word 10
tabla: .word 0, 1, 2, 3, 21, 6, 7, 92, 12, 11, 45, 6
long: .word 12
cant: .word 0
.code
ld $a0, M($zero)
daddi $a1, $zero, tabla
ld $a2, long($zero)
jal	subrutina
sd $v0, cant($zero)
halt
subrutina: dadd $v0, $zero, $zero
loop: beqz $a2, fin
ld $t0, 0($a1)
daddi $a1, $a1, 8
slt $t1, $a0, $t0
daddi $a2, $a2, -1
beqz $t1, loop
daddi $v0, $v0, 1
j loop
fin: jr $ra