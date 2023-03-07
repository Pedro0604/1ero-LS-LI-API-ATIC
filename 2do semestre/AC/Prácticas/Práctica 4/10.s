 .data
cadena: .asciiz "adbdcdedfdgdhdiddddd" 
car: .asciiz "d" 
cant: .word 0
 .code
 lbu r2, car(r0)
 dadd r3, r0, r0
 dadd r4, r0, r0
loop: lbu r1, cadena(r4)
 daddi r4, r4, 1
 dsub r5, r1, r2
 beqz r1, fin
 nop
 bnez r5, loop
 nop
 j loop
 daddi r3, r3, 1
fin: sd r3, cant(r0)
 halt