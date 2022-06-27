.data
# >>>>> program specific data declarations here:
matrix: .word 1, 41, 42
        .word 13, 56, 23
        .word 73, 9, 50
msg_output: .asciiz "Valore determinante: "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
addi $sp, $sp, -4
sw $ra, ($sp)
loadMatrix:
la $t0, matrix

lw $a0, ($t0)

lw $a1, 4($t0)

lw $a2, 8($t0)

lw $a3, 12($t0)

move $t1, $0

ciclo:
lw $t2, 16($t0)
addi $sp, $sp, -4
sw $t2, ($sp)
addiu $t0, $t0, 4
addiu $t1, $t1, 1
bne $t1, 5, ciclo
jal determinante3x3
move $t0, $v0
la $a0, msg_output
li $v0, 4
syscall
move $a0, $t0
li $v0, 1
syscall
# >>>>> your program code ends
lw $ra, 20($sp)
addiu $sp, 24
jr $ra
.end main
determinante3x3:
subu $fp, $sp, 4
subu $sp, 20
sw $s0, 4($sp)
sw $s1, 8($sp)
sw $s2, 12($sp)
sw $s3, ($sp)
sw $ra, 16, ($sp)
move $s0, $a0
move $s1, $a1
move $s2, $a2
move $s3, $a3
lw $a0, 20($fp)
lw $a1, 16($fp)
lw $a2, 8($fp)
lw $a3, 4($fp)
jal determinante2x2
mul $s0, $s0, $v0

move $a0, $s3
lw $a1, 16($fp)
lw $a2, 12($fp)
lw $a3, 4($fp)
jal determinante2x2
mul $s1, $s1, $v0

move $a0, $s3
lw $a1, 20($fp)
lw $a2, 12($fp)
lw $a3, 8($fp)
jal determinante2x2
mul $s2, $s2, $v0
add $v0, $s0, $s2
sub $v0, $v0, $s1

lw $s0, ($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
lw $ra, 16($sp)

addu $sp, 20
jr $ra
.ent determinante3x3

.ent determinante2x2
determinante2x2:
mul $t0, $a0, $a3
mul  $t1, $a1, $a2
sub $v0, $t0, $t1
jr $ra
.end determinante2x2




.end determinante2x2




