.text
daddi r3, r0, 1000
daddi r1, r0, 1
daddi r2, r0, 1
suma: dadd r1, r1, r2
slt r4, r3, r1
beqz r4, suma
dadd r2, r1, r0
halt