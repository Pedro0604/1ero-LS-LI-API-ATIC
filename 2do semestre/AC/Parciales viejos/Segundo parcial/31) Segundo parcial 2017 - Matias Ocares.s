.data
A: .word 10
.text
ld r1, A(r0)
loop: daddi r1, r1, -1
daddi r2, r2, 1
bnez r1, loop
nop
halt