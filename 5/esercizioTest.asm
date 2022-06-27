.data
# >>>>> program specific data declarations here:
op1: .word 34
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, op1
sw $t0, 0($sp)
lw $a0, 0($sp)
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main