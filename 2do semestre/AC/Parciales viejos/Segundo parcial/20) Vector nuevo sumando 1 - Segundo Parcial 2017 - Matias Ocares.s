.data
vector: .word 1234, 2345, 3456, 4567, 5678
nuevo: .word 0
.text
daddi $t0, $zero, 0
daddi $t9, $zero, 5
loop: ld $t1, vector($t0)
daddi $t9, $t9, -1
daddi $t1, $t1, 1
sd $t1, nuevo($t0)
daddi $t0, $t0, 8
bnez $t9, loop
halt