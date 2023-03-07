.data
tabla1: .word 4, 11, 18, 6, 17, 25, 9, 0, 11, 23     #rojo(mint1,maxt2)=rojo(0,49)=arriba a la izquierda
tabla2: .word 49, 24, 21, 18, 16, 0, 10, 13, 15, 18  #verde(mint2,maxt1)=verde(0,25)=en el medio a la izquierda
verde: .byte 0, 255, 0, 0
rojo: .byte 255, 0, 0, 0
control: .word32 0x10000
data: .word32 0x10008
.text
lwu $s6, control($zero)
lwu $s7, data($zero)
daddi $a0, $zero, tabla1
daddi $a1, $zero, 10
jal minMax
dadd $s0, $zero, $v0
dadd $s1, $zero, $v1
daddi $a0, $zero, tabla2
daddi $a1, $zero, 10
jal minMax
dadd $s2, $zero, $v0
dadd $s3, $zero, $v1
lw $t0, rojo($zero)
sw $t0, 0($s7)
sb $s3, 4($s7)
sb $s0, 5($s7)
daddi $t0, $zero, 5
sd $t0, 0($s6)
lw $t0, verde($zero)
sw $t0, 0($s7)
sb $s1, 4($s7)
sb $s2, 5($s7)
daddi $t0, $zero, 5
sd $t0, 0($s6)
halt

minMax: daddi $v0, $zero, 9999
daddi $v1, $zero, -9999
loop: ld $t2, 0($a0)
slt $t3, $t2, $v0
beqz $t3, verSiEsMayor
dadd $v0, $zero, $t2
verSiEsMayor: slt $t3, $v1, $t2
beqz $t3, sigNum
dadd $v1, $zero, $t2
sigNum: daddi $a0, $a0, 8
daddi $a1, $a1, -1
bnez $a1, loop
jr $ra


