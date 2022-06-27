.data
# >>>>> program specific data declarations here:
NUM_ELEMENTI = 4
DIM = 4 * NUM_ELEMENTI
DIM2 = DIM - 1
vettoreRiga: .word 12, 56, 1, -5
vettoreColonna: .word -51, 11, 0, 4
matrice: .space DIM * NUM_ELEMENTI
warningOverflow: .asciiz "\nOVERFLOW ERROR\n"
space: .asciiz " "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0 #offset matrice, ovvero il contatore vettore
li $t1, 0 #contatore righe
cicloRiga:
lw $t3, vettoreRiga($t1)
li $t2, 0 #contatore colonne 
cicloColonna:
lw $t4, vettoreColonna($t2)
mult $t3, $t4
mfhi $t4
beq $t4, $0, noOverflow
bne $t4, 0xFFFFFFFF, overflow
noOverflow:
mflo $t4
sw $t4, matrice($t0)
addi $t0, $t0, 4
addi $t2, $t2, 4
blt $t2, DIM, cicloColonna 
addi $t1, $t1, 4
blt $t1, DIM, cicloRiga
j fine
overflow:
la $a0, warningOverflow
li $v0, 4
syscall
fine:
la $t0, matrice
li $t1, 0 # contatore
ciclo_print: li $v0, 1 # call code, Print int
lw $a0, ($t0) # value for int to print
syscall # system call
beq $t1, DIM2, fine2
la $a0, space
li $v0, 4 # call code, Print string
syscall
add $t1, $t1, 1
add $t0, $t0, 4
j ciclo_print
fine2: nop

#fine:
#la $t0, matrice
#li $t1, 0
#li $v0, 4
#loopStampa:
## stampo la matrice risultante
#lw $a0, ($t0) 
#syscall
#addi $t0, $t0, 4
#blt $t0, DIM, loopStampa
# >>>>> your program code ends
li $v0, 10
syscall
.end main