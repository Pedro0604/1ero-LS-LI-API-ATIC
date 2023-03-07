.data
tabla: .word 4,11,18,6,17,28,9,0,11,23,15,6,37,29,14
mayor: .word 10
cantidad: .word 15
nuevo: .word 0
.text
ld $s0, cantidad($zero)
dadd $s1, $zero, $zero
ld $s2, mayor($zero)
dadd $s3, $zero, $zero
dadd $s4, $zero, $zero
loopTabla: ld $t0, tabla($s1)
slt $t1, $s2, $t0
bnez $t1, esMayor
j finLoopTabla
esMayor: sd $t0, nuevo($s4)
daddi $s3, $s3, 1
daddi $s4, $s4, 8
finLoopTabla: daddi $s0, $s0, -1
daddi $s1, $s1, 8
bnez $s0, loopTabla
sd $s3, cantidad($zero)
halt