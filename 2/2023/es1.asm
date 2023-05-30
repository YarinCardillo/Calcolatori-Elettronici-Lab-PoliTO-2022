.data
# >>>>> program specific data declarations here:
print1: .asciiz "Inserisci intero. Ti dico se e' pari o dispari:\n"
printPari: .asciiz "Pari\n"
printDispari: .asciiz "Dispari\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
li $t1, 1
and $t0, $v0, $t1
bne $t0, $0, dispari
pari:
la $a0, printPari
j fine
dispari:
la $a0, printDispari
fine:
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main