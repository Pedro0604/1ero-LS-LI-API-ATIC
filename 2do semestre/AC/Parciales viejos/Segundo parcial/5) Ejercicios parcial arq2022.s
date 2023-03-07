.code
daddi $t0, $0, 0x10
daddi $t1, $0, 20
daddi $t3, $0, 256
arriba: sd $t3, 0($t0)
daddi $t0, $t0, 8
daddi $t1, $t1, -1
bnez $t1, arriba
daddi $t4, $0, 0x20
lwu $t5, 0($t4)
halt