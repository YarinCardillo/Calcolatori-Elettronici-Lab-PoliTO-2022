.data
# >>>>> program specific data declarations here:
giorni: .byte 400
ore: .byte 14
minuti: .byte 32
msg_overflow: .asciiz "Overflow!\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lb $t0, giorni
lb $t1, ore
lb $t2, minuti
li $t3, 24
li $t4, 60

multu $t0, $t3
mfhi $t0
bne $t0, $0, overflowError
mflo $t0

multu $t0, $t4
mfhi $t0
bne $t0, $0, overflowError
mflo $t0

multu $t1, $t4
mfhi $t1
bne $t1, $0, overflowError
mflo $t1

add $t5, $t0, $t1
bltu $t5, $t0, overflowError
move $t0, $t5

add $t5, $t0, $t2
bltu $t5, $t0, overflowError
move $t0, $t5

j print
overflowError:
la $a0, msg_overflow
li $v0, 4
syscall
j fine
print:
move $a0, $t0
li $v0, 1
syscall
fine: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main