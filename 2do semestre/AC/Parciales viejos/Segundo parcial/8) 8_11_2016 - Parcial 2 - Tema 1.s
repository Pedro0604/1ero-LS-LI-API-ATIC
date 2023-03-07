.data
A: .word 0
B: .word 0
C: .word 0
res: .word 0
control: .word32 0x10000
data: .word32 0x10008
.text
lwu $s6, data($zero)
lwu $s7, control($zero)
daddi $t0, $zero, 8
sd $t0, 0($s7)
ld $a0, 0($s6)
sd $a0, A($zero)
sd $t0, 0($s7)
ld $a1, 0($s6)
sd $a1, B($zero)
sd $t0, 0($s7)
ld $a2, 0($s6)
sd $a2, C($zero)
jal calculo
sd $v0, 0($s6)
sd $v0, res($zero)
daddi $t0, $zero, 2
sd $t0, 0($s7)
halt

calculo: dsub $t0, $a0, $a1
daddi $v0, $zero, 1
beqz $a2, finLoopPotencia
loopPotencia: daddi $a2, $a2, -1
dmul $v0, $v0, $t0
bnez $a2, loopPotencia
finLoopPotencia: jr $ra