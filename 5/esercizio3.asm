.data
# >>>>> program specific data declarations here:
msgInput: .asciiz "Inserisci i valori di A, B e C (separati da invio):\n"
msgDueSoluzioni: .asciiz "\nEsistono due soluzioni reali"
msgNoSoluzioni: .asciiz "\nNon esistono soluzioni reali"
msgSolCoincidenti: .asciiz "\nEsistono due soluzioni coincidenti"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, msgInput
li $v0, 4
syscall
li $v0, 5
syscall
move $t0, $v0
li $v0, 5
syscall
move $t1, $v0
li $v0, 5
syscall
move $t2, $v0
mul $t3, $t1, $t1
mul $t4, $t0, $t2
sll $t4, $t4, 2
sub $t3, $t3, $t4
beq $t3, 0, solCoinc
slt $t3, $t3, 0
bne $t3, 0, noSol 
la $a0, msgDueSoluzioni
b print
solCoinc:
la $a0, msgSolCoincidenti
noSol:
la, $a0, msgNoSoluzioni
print:
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main