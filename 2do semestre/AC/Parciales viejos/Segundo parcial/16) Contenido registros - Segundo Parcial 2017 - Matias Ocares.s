.data
dato: .word 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21
.text
daddi r4, r0, 0
ld r6, dato(r4)
lazo: dadd r4, r4, r6
dsll r7, r4, 2
daddi r6, r6, -1
bnez r6, lazo
daddi r6, r6, -2
halt