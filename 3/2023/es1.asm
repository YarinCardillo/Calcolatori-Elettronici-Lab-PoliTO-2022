.data
# >>>>> program specific data declarations here:
print1: .asciiz "Inserisci un numero intero\n"
print2: .asciiz "\nErrore\n"
print3: .asciiz "\nOk"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
insert:
li $t0, 0
la $a0, print1
li $v0, 4
syscall
loop:
li $v0, 12
syscall
beq $v0, '\n', fine
blt $v0, 48, error
bgt $v0, 57, error
addi $t0, $t0, 1
j loop
error:
la $a0, print2
li $v0, 4
syscall
li $t0, 0
j insert
fine:
beq $t0, 0, error
la $a0, print3
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main