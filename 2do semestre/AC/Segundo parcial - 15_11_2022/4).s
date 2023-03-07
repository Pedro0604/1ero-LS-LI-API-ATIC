.data
num: .double 0.0
valor: .double 7.85
msj: .asciiz "El resultado es: "
control: .word32 0x10000
data: .word32 0x10008
.text
lwu $s6, control($zero)
lwu $s7, data($zero)
daddi $t0, $zero, 8
sd $t0, 0($s6)
l.d f0, 0($s7)
l.d f1, valor($zero)
c.le.d f0, f1
bc1t menor_o_igual
sub.d f2, f0, f1
mul.d f2, f2, f0
j finCalculo
menor_o_igual: sub.d f2, f1, f0
div.d f2, f2, f0
finCalculo: daddi $t0, $zero, msj
sd $t0, 0($s7)
daddi $t0, $zero, 4
sd $t0, 0($s6)
s.d f2, 0($s7)
daddi $t0, $zero, 3
sd $t0, 0($s6)
halt