.data
# >>>>> program specific data declarations here:
print1: .asciiz "Inserire un intero positivo:\n"
print2: .asciiz "Il valore inserito e' pari"
print3: .asciiz "Il valore inserito e' dispari"
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

move $t0, $v0
andi $t0, $t0, 1
beq $t0, 1, dispari

pari:
la $a0, print2
li $v0, 4
syscall
j fine

dispari:
la $a0, print3
li $v0, 4
syscall

fine: nop

# >>>>> your program code ends
li $v0, 10
syscall
.end main