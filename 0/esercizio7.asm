.data
# >>>>> program specific data declarations here:
DIM = 4
wArray: .space 20
print1: .asciiz "Insert numbers\n"
print2: .asciiz "The minimum value is:\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
print1here:
la $a0, print1
li $v0, 4
syscall

arrayAddressing1:
la $t0, wArray
li $t1, 0

arrayGetterLoop:
li $v0, 5
syscall
sw $v0, ($t0)
beq $t1, DIM, arrayAddressing2
add $t1, $t1, 1
add $t0, $t0, 4
j arrayGetterLoop

arrayAddressing2:
la $t0, wArray
li $t1, 0

comparisonAlgorithmStartsHere:
lw $t2, ($t0)
add $t0, $t0, 4
lw $t3, ($t0)

if:
beq $t1, DIM, print2here
blt $t2, $t3, true

false:
lw $t2, ($t0)
add $t0, $t0, 4
lw $t3, ($t0)
add $t0, $t0, 4
add $t1, $t1, 1
j if

true:
add $t0, $t0, 4
lw $t3, ($t0)
add $t1, $t1, 1
j if

print2here:
la $a0, print2
li $v0, 4
syscall
li $v0, 1
move $a0, $t2
syscall

end: nop

# >>>>> your program code ends
li $v0, 10
syscall
.end main