.data
# >>>>> program specific data declarations here:
wVett: .space 20
print1: .asciiz "Insert 5 numbers:\n"
print2: .asciiz "\nMin is:\n"
DIM = 5
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:

InizializationsAndPrint:
# loads first array cell address and initializes loop counter to zero
la $t0, wVett
li $t1, 0
# prints "print1" string
la $a0, print1
li, $v0, 4
syscall


loopInputAndStore:
# gets integer input
li $v0, 5
syscall
# stores integer in the array, increments array address ($t0) and loop counter ($t4)
sw $v0, ($t0)
add $t0, $t0, 4
add $t1, $t1, 1
bne $t1, DIM, loopInputAndStore


InizializationsAndPrint2:
# prints "print2" string
la $a0, print2
li, $v0, 4
syscall
# loads first array cell address and initializes loop counter to zero
la $t0, wVett
li $t1, 0
# initializes min value
lw $t2, ($t0)

loopCalcMin:
lw $t3, ($t0)
blt $t3, $t2, Minimum
add $t0, $t0, 4
add $t1, $t1, 1
bne $t1, DIM, loopCalcMin
j End

Minimum:
lw $t2, ($t0)
j loopCalcMin

End:
move $a0, $t2
li, $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main