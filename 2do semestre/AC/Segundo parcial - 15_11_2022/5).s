.data
cadena: .asciiz "Ejemplo"
resul: .word 0
.text
daddi $t1, $zero, 0
daddi $t2, $zero, 0
loop: lbu $t3, cadena($t1)
daddi $t2, $t2, 1
bnez $t3, loop
daddi $t1, $t1, 1
sd $t2, resul($zero)
halt