.text
daddi $t7, $zero, 5
daddi $t7, $t7, 99
siguiente: daddi $t7, $t7, -1
bnez $t7, siguiente
halt