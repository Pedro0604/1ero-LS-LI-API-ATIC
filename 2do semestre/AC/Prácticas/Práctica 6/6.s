.data
color: .byte 255, 0, 255, 0     # color: máximo rojo + máximo azul => magenta
msjIngresoX: .asciiz "Ingrese la coordenada X: "
msjIngresoY: .asciiz "Ingrese la coordenada Y: "
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $s6, CONTROL($zero)         # $s6 = dirección de CONTROL
lwu $s7, DATA($zero)            # $s7 = dirección de DATA

daddi $t0, $zero, 7             # $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s6)                  # CONTROL recibe 7 y limpia la pantalla gráfica


daddi $t0, $zero, 6             # $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s6)                  # CONTROL recibe 6 y limpia la pantalla alfanumérica

daddi $t0, $zero, msjIngresoX
sd $t0, 0($s7)

daddi $t0, $zero, 4
sd $t0, 0($s6)

daddi $t0, $zero, 8
sd $t0, 0($s6)

lb $s0, 0($s7)

daddi $t0, $zero, msjIngresoY
sd $t0, 0($s7)

daddi $t0, $zero, 4
sd $t0, 0($s6)

daddi $t0, $zero, 8
sd $t0, 0($s6)

lb $s1, 0($s7)


sb $s0, 5($s7)                  # DATA+5 recibe el valor de coordenada X


sb $s1, 4($s7)                  # DATA+4 recibe el valor de coordenada Y

lwu $s2, color($zero)           # $s2 = valor de color a pintar
sw $s2, 0($s7)                  # DATA recibe el valor del color a pintar
daddi $t0, $zero, 5             # $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s6)                  # CONTROL recibe 5 y produce el dibujo del punto
halt