.data
# >>>>> program specific data declarations here:
wVar: .word 3
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 10
sw $t0, wVar
# >>>>> your program code ends
li $v0, 10
syscall
.end main