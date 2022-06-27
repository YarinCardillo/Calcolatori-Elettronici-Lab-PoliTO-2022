.data
# >>>>> program specific data declarations here:
DIM = 10
Pitagora: .space 100
space: .asciiz " "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $t0, Pitagora
li $t1, 1
cicloRiga:
li $t2, 1
cicloColonna:
multu $t1, $t2
mflo $t3
sb $t3, ($t0)
addi $t0, $t0, 1
addi $t2, $t2, 1
ble $t2, DIM, cicloColonna
addi $t1, $t1, 1
ble $t1, DIM, cicloRiga


#la $t0, Pitagora
#li $t1, 0
#ciclo_print: li $v0, 1 # call code, Print int
#lw $a0, ($t0) # value for int to print
#syscall # system call
#beq $t1, DIM, fine
#la $a0, space
#li $v0, 4 # call code, Print string
#syscall
#add $t1, $t1, 1
#add $t0, $t0, 4
#j ciclo_print
#fine: nop

# >>>>> your program code ends
li $v0, 10
syscall
.end main