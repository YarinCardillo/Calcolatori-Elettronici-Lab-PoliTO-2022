.data
# >>>>> program specific data declarations here:
print1: .asciiz "Introdurre un intero:\n"
print2: .asciiz "I tuoi numeri:\n"
acapo: .ascii "\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
#inserimento numeri da tastiera
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0

#stampa numeri prima di scambio
la $a0, print2
li $v0, 4
syscall
add $a0, $t1, $0
li $v0, 1
syscall
la $a0, acapo
li $v0, 4
syscall
add $a0, $t2, $0
li $v0, 1
syscall
la $a0, acapo
li $v0, 4
syscall

#scambio
add $t1, $t1, $t2
sub $t2, $t1, $t2
sub $t1, $t1, $t2

#stampa dei numeri dopo lo scambio
la $a0, print2
li $v0, 4
syscall
add $a0, $t1, $0
li $v0, 1
syscall
la $a0, acapo
li $v0, 4
syscall
add $a0, $t2, $0
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main