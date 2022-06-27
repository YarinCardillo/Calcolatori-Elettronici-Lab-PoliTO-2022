.data
# >>>>> program specific data declarations here:
DIM = 5
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
li $t3, DIM
#li $t4, 0

#loop:
#lw $t2, ($t0)
#add $t1, $t1, $t2
#addi $t0, $t0, 4
#add $t4, 1
#bne $t3, $t4, ciclo

loop:
lw $t2, ($t0)
add $t1, $t1, $t2
add $t0, $t0, 4
add $t3, $t3, -1
beq $t3, 0, end
j loop

end:
sw $t1, wResult
# >>>>> your program code ends
li $v0, 10
syscall
.end main