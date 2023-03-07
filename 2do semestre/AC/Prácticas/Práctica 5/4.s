.data
peso: .double 75.7
altura: .double 1.73
IMC: .word 0
bajo: .double 18.5
normal: .double 25.0
obeso: .double 30
.code
l.d f1, altura(r0)
l.d f2, peso(r0)
mul.d f3, f1, f1
div.d f4, f2, f3
l.d f5, bajo(r0)
l.d f6, normal(r0)
l.d f7, obeso(r0)
c.lt.d f4, f5
bc1t infrapeso
c.lt.d f4, f6
bc1t normal
c.lt.d f4, f7
bc1t sobrepeso
daddi r1, r0, 4
j fin
infrapeso: daddi r1, r0, 1
j fin
normal: daddi r1, r0, 2
j fin
sobrepeso: daddi r1, r0, 3
fin: sd r1, IMC(r0)
halt