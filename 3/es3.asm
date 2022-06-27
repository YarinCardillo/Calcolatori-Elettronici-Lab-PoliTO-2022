.data
# >>>>> program specific data declarations here:
giorni: .byte 37
ore: .byte 20
minuti: .byte 30
msg_overflow: .asciiz "Overflow\n"
risultato: .space 4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lb $t1, giorni
lb $t2, ore

li $t0, 24
multu $t1, $t0
mfhi $t1
bne $t1, $0, overflow
mflo $t1
add $t2, $t2, $t1
bltu $t2, $t1, overflow

move $t1, $t2
lb $t2, minuti

li $t0, 60
multu $t1, $t0
mfhi $t1
bne $t1, $0, overflow
mflo $t1
add $t2, $t2, $t1
bltu $t2, $t1, overflow

move $a0, $t2
sw $t2, risultato
li $v0, 1

j stampa
overflow:
la $a0, msg_overflow
li $v0, 4
stampa:
syscall

fine: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main