.data
# >>>>> program specific data declarations here:
var: .word 0x3FFFFFF0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t1, var
add $t1, $t1, $t1
move $a0, $t1
li $v0, 1
syscall
li $t2, 40
addu $a0, $t1, $t2
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main