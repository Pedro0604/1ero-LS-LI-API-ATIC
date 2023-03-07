.code
daddi $t1, $t0, 11
daddi $t2, $t0, 13
daddi $t0, $0, 0x200
daddi $t0,$t0,-8
sd $t1, 0($t0)
daddi $t0,$t0,-8
sd $t2, 0($t0)
ld $t1, 0($t0)
daddi $t0,$t0,8
ld $t2, 0($t0)
daddi $t0,$t0,8
halt
