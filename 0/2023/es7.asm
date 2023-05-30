.data
# >>>>> program specific data declarations here:
DIM = 5
wVett: .space DIM*4
prompt1: .asciiz "Inserire 5 interi:\n"
prompt2: .asciiz "Il minimo e': "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
# Prova con questi numeri: 2 3 1 0 -1
la $a0, prompt1
li $v0, 4
syscall
li $t1, 0
la $t0, wVett
getLoop:
li $v0, 5
syscall
sw $v0, ($t0)
addi $t0, $t0, 4
addi $t1, $t1, 1
bne $t1, DIM, getLoop
#-------------
li $t1, 0
la $t0, wVett
lw $t2, ($t0)
ricercaMinimo:
beq $t1, DIM, stampaMinimo
lw $t3, ($t0)
blt $t3, $t2, setMinimo
addi $t0, $t0, 4
addi $t1, $t1, 1
j ricercaMinimo
setMinimo:
lw $t2, ($t0)
j ricercaMinimo
stampaMinimo:
la $a0, prompt2
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main