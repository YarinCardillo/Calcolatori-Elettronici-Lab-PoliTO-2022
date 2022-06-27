.data
# >>>>> program specific data declarations here:
array1: .word 12, 56, 1, -5
array2: .word -51, 11, 0, 4
printOverflow: .asciiz "Overflow! "
DIM_ARRAY = 4*4
DIM_MATRIX = DIM_ARRAY*DIM_ARRAY

# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 0

loopEsternoIN:
lw $t2, array1($t0)

loopInterno:
lw $t3, array2($t1)
mult $t2, $t3		# $t2 * $t3 = Hi and Lo registers
mfhi $t4
beq $t4, $0, noOverflow
bne $t4, 0xFFFFFFFF, overflow
noOverflow: 
mflo $a0			# copy Lo to $a0
li $v0, 1
syscall
li $a0, ' '
li $v0, 11
syscall

addi $t1, $t1, 4
bne $t1, DIM_ARRAY, loopInterno
li $t1, 0

loopEsternoOUT:
# a capo
li $a0, '\n'
li $v0, 11
syscall
addi $t0, $t0, 4
bne $t0, DIM_ARRAY, loopEsternoIN
j fine

overflow: 
la $a0, printOverflow
li $v0, 4
syscall
j loopInterno

fine: nop

# >>>>> your program code ends
li $v0, 10
syscall
.end main