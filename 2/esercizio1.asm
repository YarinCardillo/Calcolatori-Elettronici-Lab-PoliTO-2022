.data
# >>>>> program specific data declarations here:
insert: .asciiz "Inserisci un numero: " 
ansTRUE: .asciiz "\nIl numero inserito e' pari"
ansFALSE: .asciiz "Il numero inserito e' dispari"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, insert 
li $v0, 4
syscall
li $v0, 5
syscall
la $a0, ansTRUE
and $t0, $v0, 1
beq $t0, $zero, print
false:
la $a0, ansFALSE
print:
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main