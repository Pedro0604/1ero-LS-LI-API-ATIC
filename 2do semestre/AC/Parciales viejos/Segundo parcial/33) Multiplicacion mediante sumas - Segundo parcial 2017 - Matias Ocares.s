.data
x: .word 1
y: .word 829382038492384
res: .word 0
.text
ld $s0, x($zero)
ld $s1, y($zero)
beqz $s0, fin
beqz $s1, fin
slt $t0, $s0, $s1
beqz $t0, noCambiamosRegistros
dadd $t0, $zero, $s0
dadd $s0, $zero, $s1
dadd $s1, $zero, $t0
noCambiamosRegistros: dadd $t0, $zero, $zero
loop: daddi $s1, $s1, -1
dadd $t0, $t0, $s0
bnez $s1, loop
fin: sd $t0, res($zero)
halt