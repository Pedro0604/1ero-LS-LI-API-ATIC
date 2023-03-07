.data
mensaje: .asciiz "Ingrese una serie de caracteres terminadas por un enter:"
CONTROL: .word32 0x10000
DATA: .word32 0x10008
texto: .ascii " "                #El mensaje a mostrar

.text
lwu $s0, DATA($zero)            # $s0 = dirección de DATA
daddi $t0, $zero, mensaje       # $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0)                  # DATA recibe el puntero al comienzo del mensaje

lwu $s1, CONTROL($zero)         # $s1 = dirección de CONTROL
daddi $t0, $zero, 6             # $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s1)                  # CONTROL recibe 6 y limpia la pantalla

daddi $t0, $zero, 4             # $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1)                  # CONTROL recibe 4 y produce la salida del mensaje


daddi $t0, $zero, 9
dadd $t1, $zero, $zero
daddi $t2, $zero, 13

loop: sd $t0, 0($s1)

lbu $t3, 0($s0)
beq $t3, $t2, finLoop

sb $t3, texto($t1)
daddi $t1, $t1, 1
j loop

finLoop: sd $zero, texto($t1)

daddi $t0, $zero, texto         # $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0)                  # DATA recibe el puntero al comienzo del mensaje

daddi $t0, $zero, 4             # $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1)                  # CONTROL recibe 4 y produce la salida del mensaje
halt