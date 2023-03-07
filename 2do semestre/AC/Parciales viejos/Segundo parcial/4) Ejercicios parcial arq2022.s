.data
tabla: .word 20, 1, -14, 3, 2, 58, -18, -7, 12, 11
res: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.code
daddi $t4, $0, -1
daddi $t0, $0, 10
dadd $t1, $0, $0
arriba: ld $t2, tabla($t1)
slti $t3, $t2, 0
beqz $t3, abajo
dmul $t2, $t2, $t4
abajo: sd $t2, res($t1)
daddi $t0, $t0, -1
daddi $t1, $t1, 8
bnez $t0, arriba
halt