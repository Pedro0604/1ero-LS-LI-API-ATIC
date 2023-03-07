.data
A: .word 2
B: .word 2
C: .word 2
D: .word 0
.code
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
dadd r4, r0, r0
beq r1, r2, porLoMenosDosIguales
beq r1, r3, soloDosIguales
j fin
porLoMenosDosIguales: beq r1, r3, tresIguales
soloDosIguales: daddi r4, r0, 2
j fin
tresIguales: daddi r4, r0, 3
fin: sd r4, D(r0)
halt