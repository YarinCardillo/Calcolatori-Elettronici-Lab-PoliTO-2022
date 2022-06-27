.data
# >>>>> program specific data declarations here:
msg_input: .asciiz "Introdurre un numero:\n"
msg_error: .asciiz "L'input non e' un numero\n"
msg_end: .asciiz "Terminato.\n"
msg_count: .asciiz "Numero di cifre inserite: "
msg_noinput: .asciiz "Nessun numero inserito!\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:

# lettura robusta di un numero con la syscall 5
# li $v0, 5
# syscall
# beq $v0, $0, notAnumber
# move $a0, $v0
# li $v0, 1
# syscall
# j fin
# notAnumber:
# la $a0, msg_error
# li $v0, 4
# syscall
# fin: nop

li $t1, 0
j loop

errore:
la $a0, msg_error
li $v0, 4
syscall
j loop

noInput:
la $a0, msg_noinput
li $v0, 4
syscall

loop:
la $a0, msg_input
li $v0, 4
syscall

li $v0, 12
syscall

move $t0, $v0
li $a0, '\n'
li $v0, 11
syscall

beq $t0, '\n', exitloop
blt $t0, '0', errore
bgt $t0, '9', errore
addi $t1, $t1, 1
j loop

exitloop:
beq $t1, $0, noInput
la $a0, msg_end
li $v0, 4
syscall
la $a0, msg_count
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main