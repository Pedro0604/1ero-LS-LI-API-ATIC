 .data
NUM1: .word 4
NUM2: .word 5
RES: .word 0
 .code
 ld r1, NUM1(r0)
 ld r2, NUM2(r0)
 dadd r3, r0, r0
loop: daddi r2, r2, -1
 bnez r2, loop
 dadd r3, r3, r1
 sd r3, RES(r0)
 halt