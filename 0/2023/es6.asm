.data
# >>>>> program specific data declarations here:
DIM = 5
wVett: .space 4*(DIM)
acapo: .asciiz "\n"
spazio: .ascii " ; "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t1, 0
la $t0, wVett

getLoop:
#-------------
li $v0, 5
syscall
sw $v0, ($t0)
#-------------
addi $t0, $t0, 4
addi $t1, $t1, 1
#-------------
bne $t1, DIM, getLoop
#-------------
la $a0, acapo
li $v0, 4
syscall
li $t1, 0
la $t0, wVett
printLoop:
#-------------
lw $a0, ($t0)
li $v0, 1
syscall
#-------------
addi $t0, $t0, 4
addi $t1, $t1, 1
#-------------
beq $t1, DIM, fine
la $a0, spazio
li $v0, 4
syscall
j printLoop
fine: nop 
# >>>>> your program code ends
li $v0, 10
syscall
.end main