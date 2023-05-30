.data
# >>>>> program specific data declarations here:
DIM = 15
wVett: .word 2, 5, 16, 12, 34, 7, 20, 11, 31, 44, 70, 69, 2, 4, 23
wRes: .space 4
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
add $t1, $t1, $t2 #sum current array element ($t2) to $t1
add $t0, $t0, 4 #next array address
add $t3, $t3, 1 #add 1 to counter
bne $t3, DIM, loop #jump back to loop label if we're not done yet

sw $t1, wRes 
# >>>>> your program code ends
li $v0, 10
syscall
.end main