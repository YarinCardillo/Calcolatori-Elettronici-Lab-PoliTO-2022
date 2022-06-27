.data
# >>>>> program specific data declarations here:
input:  .asciiz "Inserisci una stringa: "
outputPalindromo: .asciiz "\nLa stringa e' palindroma"
outputNonPalindromo: .asciiz "\nLa stringa non e' palindroma"
outputVuoto: .asciiz "\nLa stringa non e' stata inserita"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
move $t0, $sp #posizione iniziale dello stack
move $s0, $sp #posizione iniziale dello stack
li $t1, 0 #numero di caratteri inseriti dall'utente
la $a0, input
li $v0, 4
syscall
ciclolettura:
li $v0, 12
syscall
beq $v0, '\n', fineLettura
addi $t1, $t1, 1
subu $sp, $sp, 4
sw $v0, ($sp)
b ciclolettura
fineLettura: 
beq $t1, 0, noInput
cicloControllo:
subu $t0, $t0, 4
lw $t2, ($t0)
lw $t3, ($sp)
addu $sp, $sp, 4
bne $t2, $t3, noPalindromo 
addi $t1, $t1, -2
bgt $t1, 0, cicloControllo
la $a0, outputPalindromo
b stampa
noPalindromo:
la $a0, outputNonPalindromo
b stampa
noInput:
la $a0, outputVuoto
stampa:
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main