.data
# >>>>> program specific data declarations here:
var: .half 12333
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
and $t3, $0, $0
and $t4, $0, $0
lh $t0, var
li $t1, 1
loop:
and $t2, $t0, $t1
beq $t2, $0, next
addi $t3, $t3, 1
next:
sll $t1, $t1, 1
addi $t4, $t4, 1
bne $t4, 16, loop
move $a0, $t3
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main