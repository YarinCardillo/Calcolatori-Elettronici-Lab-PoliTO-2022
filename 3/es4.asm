.data
# >>>>> program specific data declarations here:
DIM = 4
print1: .asciiz "Insert value:\n"
print2: .asciiz "AVG: "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 0
loop:
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
add $t1, $t1, $v0
addiu $t0, $t0, 1
bne $t0, DIM, loop
calcoloMedia:
div $t1, $t1, DIM
fine:
la $a0, print2
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main