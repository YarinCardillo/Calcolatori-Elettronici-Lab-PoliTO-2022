.data
# >>>>> program specific data declarations here:
hugeNumber: .word 3141592653
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:

#li $a0, 3141592653
#li $v0, 1
#syscall

lw $t0, hugeNumber
li $t0, 0 #numero di cifre da stampare
li $t1, 10 #divisore 
lw $t2, hugeNumber
ciclo1:
divu $t2, $t1
mfhi $t2 #metto il resto in $t2
addu $t0, $t0, 1
subu $sp, $sp, 4
sw $t2, ($sp)
mflo $t2
bne $t2, $zero, ciclo1
li $v0, 11
li $a0, '\n'
syscall
ciclo2:
lw $a0, ($sp)
addu $a0, $a0, '0'
syscall
addu $sp, $sp, 4
subu $t0, $t0, 1
bne $t0, $zero, ciclo2
# >>>>> your program code ends
li $v0, 10
syscall
.end main