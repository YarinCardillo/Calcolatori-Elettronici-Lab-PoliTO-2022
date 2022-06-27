.data
# >>>>> program specific data declarations here:
msg_input: .asciiz "Introdurre un numero:\n"
msg_error: .asciiz "\nL'input non e' un numero\n"
msg_overflow: .asciiz "\nOverflow\n"
msg_end: .asciiz "\nTerminato."
msg_noinput: .asciiz "Nessun numero inserito!\n"
msg_numeroInserito: .asciiz "Numero inserito: "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, msg_input
li $v0, 4
syscall
li $t1, 0
li $t2, 0
j loop

errore:
la $a0, msg_error
li $v0, 4
syscall
li $t2, 0
la $a0, msg_input
li $v0, 4
syscall

j loop

overflow:
la $a0, msg_overflow
li $v0, 4
syscall
li $t2, 0
la $a0, msg_input
li $v0, 4
syscall

j loop

noInput:
la $a0, msg_noinput
li $v0, 4
syscall
la $a0, msg_input
li $v0, 4
syscall

loop:
li $v0, 12
syscall
beq $v0, '\n', exitloop
blt $v0, '0', errore
bgt $v0, '9', errore
sub $t0, $v0, '0'
li $t3, 10
multu $t2, $t3
checkOverflow:
mfhi $t2
bne $t2, $0, overflow
mflo $t2
add $t2, $t2, $t0
bltu $t2, $t0, overflow
addi $t1, $t1, 1
j loop

exitloop:
beq $t1, $0, noInput
la $a0, msg_numeroInserito
li $v0, 4
syscall

move $a0, $t2
li $v0, 1
syscall


la $a0, msg_end
li $v0, 4
syscall

# >>>>> your program code ends
li $v0, 10
syscall
.end main