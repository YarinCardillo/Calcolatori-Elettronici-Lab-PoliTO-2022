# legge DIM elementi di un vettore e li visualizza sulla console (schermo) in ordine inverso
.data
DIM = 5
vett: .space DIM
.text
.globl main
.ent main
main:
la $t2, vett
and $t3, $0, $0 # index
lab1: li $v0, 12 # read one character
syscall
sb $v0, ($t2)
addi $t2, $t2, 1
addi $t3, $t3, 1 # update index
bne $t3, 5, lab1 # repeat 5 times
lab2: addi $t3, $t3, -1 # update index
addi $t2, $t2, -1
lb $a0, ($t2)
li $v0, 11 # write one character
syscall
bne $t3, 0, lab2 # repeat 5 times
li $v0, 10
syscall
.end main