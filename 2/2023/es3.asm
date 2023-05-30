.data
# >>>>> program specific data declarations here:
op1: .word 13
op2: .word 14
op3: .word 12
space: .ascii " "
acapo: .ascii "\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $a0, op1
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

lw $a0, op2
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

lw $a0, op3
li $v0, 1
syscall
la $a0, acapo
li $v0, 4
syscall
syscall

lw $t0, op1
lw $t1, op2
lw $t2, op3
check1:
bgt $t0, $t1, swap1
check2:
bgt $t0, $t2, swap2
check3:
bgt $t1, $t2, swap3
j fine
swap1:
move $t6, $t0
move $t0, $t1
move $t1, $t6
j check2
swap2:
move $t6, $t0
move $t0, $t2
move $t2, $t6
j check3
swap3:
move $t6, $t1
move $t1, $t2
move $t2, $t6
fine:
move $a0, $t0
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

move $a0, $t1
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall
la $a0, space
li $v0, 4
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main