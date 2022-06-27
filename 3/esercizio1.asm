.data
# >>>>> program specific data declarations here:
messageInput: .asciiz "Inserire numero: "
messageError: .asciiz "\nNon e' un numero!\n"
messageOk:    .asciiz "L'input e' corretto"
messageEmpty: .asciiz "Non e' stato inserito nessun carattere!"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, messageInput
li, $v0, 4
syscall
move $t0, $0

loop:
li $v0, 12
syscall
beq $v0, '\n', exitLoop
blt $v0, '0', error 
bgt $v0, '9', error 
addi $t0, $t0, 1
b loop

exitLoop:
beq $t0, $0, noInput
la $a0, messageOk
b end

noInput:
la $a0, messageEmpty
b end

error:
la $a0, messageError
b end

end:
li, $v0, 4
syscall

# >>>>> your program code ends
li $v0, 10
syscall
.end main 