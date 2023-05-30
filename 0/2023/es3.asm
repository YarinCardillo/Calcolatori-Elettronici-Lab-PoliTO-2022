.data
# >>>>> program specific data declarations here:
wOpd1: .word 10
wOpd2: .word 24
wRes: .space 4
# >>>>> end declarations 
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, wOpd1
lw $t1, wOpd2
add $t0, $t0, $t1 
sw $t0, wRes
# >>>>> your program code ends
li $v0, 10
syscall
.end main