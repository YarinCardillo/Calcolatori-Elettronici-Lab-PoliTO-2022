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
la $t0, wVett
li $t1, 0

# 0
lw $t2, ($t0)
add $t1, $t1, $t2
addi $t0, $t0, 4

# 1
lw $t2, ($t0)
add $t1, $t1, $t2
addi $t0, $t0, 4

# 2
lw $t2, ($t0)
add $t1, $t1, $t2
addi $t0, $t0, 4

# 3
lw $t2, ($t0)
add $t1, $t1, $t2
addi $t0, $t0, 4

# 4
lw $t2, ($t0)
add $t1, $t1, $t2
addi $t0, $t0, 4

# store result 
sw $t1, wResult

# >>>>> your program code ends
li $v0, 10
syscall
.end main