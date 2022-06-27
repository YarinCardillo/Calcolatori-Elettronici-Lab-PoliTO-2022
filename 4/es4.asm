.data
# >>>>> program specific data declarations here:
tavola: .space 100
DIM = 10+1
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 1 #operatore
li $t1, 1 #moltiplicatore
li $t2, 0 #risultato da storare
li $t3, 0 #address matrice
loopInterno:
mult $t0, $t1
mflo $t2
sb $t2, tavola($t3)
move $a0, $t2
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
addi $t1, $t1, 1
addi $t3, $t3, 1
bne $t1, DIM, loopInterno
li $t1, 1
loopEsterno:
addi $t0, $t0, 1
li $a0, '\n'
li $v0, 11
syscall
bne $t0, DIM, loopInterno
# >>>>> your program code ends
li $v0, 10
syscall
.end main