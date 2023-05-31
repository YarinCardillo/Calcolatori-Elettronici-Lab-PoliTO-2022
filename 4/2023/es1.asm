.data
# >>>>> program specific data declarations here:
DIM = 20
wArray: .space 4*DIM
spazio: .asciiz "\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0 #counter
la $t1, wArray
li $t2, 1
sw $t2, ($t1)
addi $t1, $t1, 4
sw $t2, ($t1)
addi $t1, $t1, 4
loop:
lw $t3, -4($t1)
lw $t4, -8($t1)
beq $t0, DIM, prestampa
add $t2, $t3, $t4
sw $t2, ($t1)
addi $t0, $t0, 1
addi $t1, $t1, 4
j loop
prestampa:
li $t0, 0
la $t1, wArray
stampa:
beq $t0, DIM, fine
lw $a0, ($t1)
li $v0, 1
syscall
la $a0, spazio
li $v0, 4
syscall
addi $t0, $t0, 1
addi $t1, $t1, 4
j stampa
fine: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main