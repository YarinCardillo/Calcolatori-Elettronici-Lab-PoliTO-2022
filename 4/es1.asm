.data
# >>>>> program specific data declarations here:
N_ELEM = 20
DIM_ARRAY = 4 * N_ELEM
wVet: .space DIM_ARRAY
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 1
sw $t1, wVet($t0)
lw $a0, wVet($t0)
li $v0, 1
syscall
li $a0, '\n'
li $v0, 11
syscall
addi $t0, $t0, 4
li $t2, 1
sw $t2, wVet($t0)
lw $a0, wVet($t0)
li $v0, 1
syscall
li $a0, '\n'
li $v0, 11
syscall
addi $t0, $t0, 4
loop:
add $t3, $t1, $t2
sw $t3, wVet($t0)
lw $a0, wVet($t0)
li $v0, 1
syscall
li $a0, '\n'
li $v0, 11
syscall
move $t1, $t2
move $t2, $t3
addi $t0, $t0, 4
blt $t0, DIM_ARRAY, loop
li $a0, '\n'
li $v0, 11
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main