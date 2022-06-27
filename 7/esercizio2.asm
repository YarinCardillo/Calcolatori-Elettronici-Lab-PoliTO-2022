.data
# >>>>> program specific data declarations here:
insert: .asciiz "Inserisci un valore numerico: "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
subu $sp, 4
sw $ra, ($sp)
la $a0, insert
li $v0, 4
syscall
li $v0, 5
syscall
move $a0, $v0
jal calcolaSuccessivo
# >>>>> your program code ends
lw $ra, ($sp)
addiu $sp, 4
jr $ra
.end main
calcolaSuccessivo:
andi $t0, $a0, 1
bnez $t0, dispari
li $t1, 2
divu $a0, $t1
mflo $a0
j end
dispari:
li $t1, 3
mult $a0, $t1
mflo $a0
addi $a0, $a0, 1
end: 
li $v0, 1
syscall
move $v0, $a0
jr $ra
.end calcolaSuccessivo