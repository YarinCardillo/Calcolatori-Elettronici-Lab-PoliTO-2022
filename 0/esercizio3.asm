.data
# >>>>> program specific data declarations here:
wOpd1: .word 10
wOpd2: .word 24
wResult: .space 4

.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, wOpd1
lw $t1, wOpd2
add $t2, $t1, $t0
sw $t2, wResult
# >>>>> your program code ends
li $v0, 10
syscall
.end main