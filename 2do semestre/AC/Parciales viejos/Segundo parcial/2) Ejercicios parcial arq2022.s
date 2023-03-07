.code
daddi $t0, $0, 1
dmul $t2, $t0, $t0
daddi $t3, $0, 1
daddi $t4, $0, 10
bnez $t0, abajo
daddi $t1, $t0, 1
abajo: halt