.data
TABLA: .word -1, 8, -2342, 4, 134234, -123123, 1989, 5, 3, 0
X: .word 4
CANT: .word 0
RES: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
LONG: .word 10
NUM: .word 0x8000000000000000
 .code
 ld r1, X(r0)
 dadd r2, r0, r0
 ld r3, LONG(r0)
 ld r4, LONG(r0)
 ld r8, NUM(r0)
loop: ld r5, TABLA(r2)
 daddi r4, r4, -1
 dsub r6, r1, r5
 and r6, r6, r8
 bnez r6, siguiente
 sd r0, RES(r2)
 daddi r3, r3, -1
siguiente: daddi r2, r2, 8
 bnez r4, loop
fin: sd r3, CANT(r0)
 halt
