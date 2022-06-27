.data
# >>>>> program specific data declarations here:
wVett: .word 5, 7, 3, 4, 3
wResult: .space 4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t1, 0
la $t0, wVett

lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4

lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4

lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4

lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4

lw $t2, ($t0)
add $t1, $t1, $t2

sw $t1, wResult
# >>>>> your program code ends
li $v0, 10
syscall
.end main