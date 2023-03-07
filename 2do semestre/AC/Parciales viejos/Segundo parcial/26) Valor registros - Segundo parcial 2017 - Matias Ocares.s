.data
A: .word 1
B: .word 6
.text
dadd r15, r0, r0
daddi r15, r0, 8
ld r1, A(r0)
ld r2, A(r15)
ld r3, B(r0)
dsub r5, r2, r3
halt