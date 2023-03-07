.data
valor: .word 23
exponente: .word 12
resultado: .word 0

.text
ld $a0, valor($zero)
ld $a1, exponente($zero)
jal a_la_potencia
sd $v0, resultado($zero)
halt
a_la_potencia: daddi $v0, $zero, 1
lazo: slti $t1, $a1, 1
bnez $t1, terminar
daddi $a1, $a1, -1
dmul $v0, $v0, $a0
j lazo
terminar: jr $ra 
