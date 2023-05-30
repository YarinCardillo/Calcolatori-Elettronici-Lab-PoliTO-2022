.data
# >>>>> program specific data declarations here:
op1: .half 15
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lh $t0, op1
li $t1, 1
li $t2, 0
li $t3, 0
ciclo:
and $t4, $t0, $t1
beq $t4, $0, next
addi $t3, $t3, 1
next:
sll $t1, $t1, 1
addi $t2, $t2, 1
bne $t2, 16, ciclo
# >>>>> your program code ends
li $v0, 10
syscall
.end main