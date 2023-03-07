.data
tabla: .word 1, 2, 3, 4, 5
.text
daddi r14, r0, 5
dadd r15, r0, r0
loop: sd r15, tabla(r15)
daddi r14, r14, -1
daddi r15, r15, 8
bnez r14, loop
halt