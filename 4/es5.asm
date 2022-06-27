.data
# >>>>> program specific data declarations here:
NUMCOL = 6
NUMRIG = 4
DIMRIG = 4 * NUMCOL
wMatrix: .word 1, 2, 4, 5, 1, 0, 1, -3, -3, 5, 4, 0, 3, -3, 1, 2, -5, 0, 0, 0, 0, 0, 0, 0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 0
li $t2, 0
loop1:
lw $a0, wMatrix($t0)
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
addi $t0, $t0, 4
addi $t1, $t1, 1
bne $t1, NUMCOL, loop1
loop2: 
li $a0, '\n'
li $v0, 11
syscall
li $t1, 0
addi $t2, $t2, 1
bne $t2, NUMRIG, loop1

li $t0, 0
li $t1, 1
li $t2, 1
li $t3, 0

loopInterno:
lw $t4, wMatrix($t0)
add $t3, $t3, $t4
addi $t0, $t0, 4
addi $t2, $t2, 1
bne $t2, NUMCOL, loopInterno
loopEsternoOUT:
sw $t3, wMatrix($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
li $t2, 1
li $t3, 0
bne $t1, NUMRIG, loopInterno

li $t1, 0
li $t2, 1
li $t3, 0

loopEsterno2IN:
li $t0, 0
sll $t3, $t1, 2
add $t0, $t0, $t3
li $t2, 1
li $t3, 0
loopInterno2:
lw $t4, wMatrix($t0)
add $t3, $t3, $t4
addi $t0, $t0, DIMRIG
addi $t2, $t2, 1
bne $t2, NUMRIG, loopInterno2
loopEsterno2OUT:
sw $t3, wMatrix($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
bne $t1, NUMCOL, loopEsterno2IN

li $a0, '\n'
li $v0, 11
syscall

li $t0, 0
li $t1, 0
li $t2, 0
loop3:
lw $a0, wMatrix($t0)
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall
addi $t0, $t0, 4
addi $t1, $t1, 1
bne $t1, NUMCOL, loop3
loop4: 
li $a0, '\n'
li $v0, 11
syscall
li $t1, 0
addi $t2, $t2, 1
bne $t2, NUMRIG, loop3
# >>>>> your program code ends
li $v0, 10
syscall
.end main