.data
control: .word32 0x10000
data: .word32 0x10008
n: .word 12
tabla1: .double 25.0, 24.0, 21.0, 18.0, 16.0, 12.0, 10.0, 13.0, 15.0, 18.0, 22.0, 24.0
tabla2: .double 0.0
.text
ld $s0, n($zero)
daddi $s0, $s0, -1
dadd $s1, $zero, $zero
dadd $s2, $zero, $zero
loopTabla1: l.d f0, tabla1($s1)
daddi $s1, $s1, 8
l.d f1, tabla1($s1)
jal promedio
s.d f3, tabla2($s2)
daddi $s2, $s2, 8
daddi $s0, $s0, -1
bnez $s0, loopTabla1

daddi $a0, $zero, tabla2
jal muestra
halt


promedio: add.d f0, f0, f1
daddi $t0, $zero, 2
mtc1 $t0, f2
cvt.d.l f2, f2
div.d f3, f0, f2
jr $ra

muestra: lwu $t8, control($zero)
lwu $t9, data($zero)
ld $t0, n($zero)
daddi $t0, $t0, -1
daddi $t7, $zero, 3
loopMuestra: l.d f0, 0($a0)
s.d f0, 0($t9)
sd $t7, 0($t8)
daddi $a0, $a0, 8
daddi $t0, $t0, -1
bnez $t0, loopMuestra