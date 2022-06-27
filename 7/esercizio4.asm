.data
# >>>>> program specific data declarations here:
matrix: .word 6, 3
        .word 2, 5
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
subu $sp, 4
sw $ra, ($sp)
loadMatrix:
la $t0, matrix

lw $a0, ($t0)
addi $t0, $t0, 4

lw $a1, ($t0)
addi $t0, $t0, 4

lw $a2, ($t0)
addi $t0, $t0, 4

lw $a3, ($t0)

jal determinante2x2
# >>>>> your program code ends
lw $ra, ($sp)
addiu $sp, 4
jr $ra
.end main
determinante2x2:
multu $a0, $a3
mflo $t0
multu $a1, $a2
mflo $t1
sub $a0, $t0, $t1
li $v0, 1
syscall
jr $ra
.end determinante2x2