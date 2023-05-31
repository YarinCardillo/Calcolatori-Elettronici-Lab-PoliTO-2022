.data
# >>>>> program specific data declarations here:
R = 4*4
C = 4*4
array1: .word 1, 2, 3, 4
array2: .word 1, 0, 1, 0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0 #counter 1
li $t1, 0 #counter 2
forRighe:
lw $t2, array1($t0)
forColonne:
lw $t3, array2($t1)
mul $a0, $t2, $t3
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
addi $t1, $t1, 4
bne $t1, C, forColonne
li $t1, 0
forRigheEsterno:
li $a0, '\n'
li $v0, 11
syscall
addi $t0, $t0, 4
bne $t0, R, forRighe
# >>>>> your program code ends
li $v0, 10
syscall
.end main