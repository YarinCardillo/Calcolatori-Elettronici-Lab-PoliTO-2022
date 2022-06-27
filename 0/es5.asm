.data
# >>>>> program specific data declarations here:
wVett: .word 5, 7, 3, 4, 3
wResult: .space 4
DIM = 5
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t1, 0
li $t3, 0
la $t0, wVett

loop:
lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4
add $t3, $t3, 1
bne $t3, DIM, loop

sw $t1, wResult
# >>>>> your program code ends
li $v0, 10
syscall
.end main
