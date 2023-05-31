.data
# >>>>> program specific data declarations here:
DIM_RIGHE = 10*4
DIM_COLONNE = 10*4
array1: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
array2: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
matrix: .space DIM_RIGHE*DIM_COLONNE*4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 0
li $t4, 0
external_loop_in:
lw $t2, array1($t0)
internal_loop:
lw $t3, array2($t1)
mul $t3, $t2, $t3
move $a0, $t3
li $v0, 1
syscall
sw $a0, matrix($t4)
li $a0, ' '
li $v0, 11
syscall
addi $t4, $t4, 4
addi $t1, $t1, 4
bne $t1, DIM_COLONNE, internal_loop
external_loop_out:
li $a0, '\n'
li $v0, 11
syscall
li $t1, 0
addi $t0, $t0, 4
bne $t0, DIM_RIGHE, external_loop_in
# >>>>> your program code ends
li $v0, 10
syscall
.end main