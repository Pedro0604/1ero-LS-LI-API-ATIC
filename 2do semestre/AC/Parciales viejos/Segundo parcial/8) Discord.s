.data
a: .double 1.3, 3.5, 5.8, 1.9, 2.7
b: .double 1.7, 9.5, 5.1, 1.6, 8.7
c: .double 6.3, 3.2, 7.8, 1.9, 3.7
res: .double 0.0
.text
daddi $t0, $zero, 0
daddi $t1, $zero, 5
loopArreglos: l.d f0, a($t0)
l.d f1, b($t0)
l.d f2, c($t0)
jal calculo
s.d f4, res($t0)
daddi $t0, $t0, 8
daddi $t1, $t1, -1
bnez $t1, loopArreglos
halt

calculo: mul.d f3, f1, f1
add.d f4, f3, f0
div.d f4, f4, f2
jr $ra