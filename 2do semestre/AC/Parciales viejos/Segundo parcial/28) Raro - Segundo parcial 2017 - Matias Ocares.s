.code
daddi r1, r0, 1
daddi r2, r0, 2
dadd r3, r0, r0
beq r1, r2, listo
bne r1, r2, fin
j fin
listo: daddi r3, r0, 1
fin: halt