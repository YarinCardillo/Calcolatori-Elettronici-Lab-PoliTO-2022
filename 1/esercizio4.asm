.data
# >>>>> program specific data declarations here:
var: .word 0x3FFFFFF0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, var
add $t1, $t0, $t0
move $a0, $t1
li $v0, 1
syscall

#overflow
#addi $a0, $t1, 40
#li $v0, 1
#syscall

addiu $a0, $t1, 40
li $v0, 1
syscall
li $t2, 40
addu $a0, $t1, $t2
li $v0, 1
syscall

#senza unsigned vado in overflow

# >>>>> your program code ends
li $v0, 10
syscall
.end main