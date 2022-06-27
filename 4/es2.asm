.data
# >>>>> program specific data declarations here:
opa: .word 2043
opb: .word 5
print0: .asciiz "Operandi:\n"
print1: .asciiz "Selezionare operazione (0 = somma / 1 = sottr / 2 = molt / 3 = div):\n"
print2: .asciiz "Risultato:\n"
print3: .asciiz "Input errato:\n"
res: .space 4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
input:
la $a0, print0
li $v0, 4
syscall
lw $a0, opa
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
lw $a0, opb
li $v0, 1
syscall
li $a0, '\n'
li $v0, 11
syscall
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall

lw $t0, opa
lw $t1, opb

switch:
li $t2, 0
beq $v0, $t2, caseAddizione
li $t2, 1
beq $v0, $t2, caseSottrazione
li $t2, 2
beq $v0, $t2, caseMoltiplicazione
li $t2, 3
beq $v0, $t2, caseDivisione
b default

caseAddizione:
add $t0, $t0, $t1
b fine

caseSottrazione:
sub $t0, $t0, $t1
b fine

caseMoltiplicazione:
mul $t0, $t0, $t1
b fine

caseDivisione:
div $t0, $t0, $t1
b fine

default:
la $a0, print3
li $v0, 4
syscall
b input

fine:
sw $t0, res
la $a0, print2
li $v0, 4
syscall
move $a0, $t0
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main