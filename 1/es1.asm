.data
# >>>>> program specific data declarations here:
n1: .byte 10
n2: .byte 0x10
n3: .byte '1'
res: .space 1
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lb $t0, n1
lb $t1, n2
sub $t0, $t0, $t1
lb $t1, n3
add $t0, $t0, $t1
sb $t0, res
# >>>>> your program code ends
li $v0, 10
syscall
.end main