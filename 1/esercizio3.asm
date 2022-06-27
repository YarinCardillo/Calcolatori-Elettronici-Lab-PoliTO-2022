.data
# >>>>> program specific data declarations here:
op1: .byte 150
op2: .byte 100
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lbu $t0, op1
lbu $t1, op2
add $a0, $t0, $t1
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main