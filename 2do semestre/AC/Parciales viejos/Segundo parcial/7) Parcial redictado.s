.data
control: .word32 0x10000
data: .word32 0x10008
titulo: .asciiz "skajdlakjsd"
.code
lwu $s6, control ($0)
lwu $s7, data ($0)
daddi $s0, $zero, titulo
sd $s0, 0($s7)
daddi $t0, $zero, 4
sd $t0, 0($s6)
halt