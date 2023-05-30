.data
# >>>>> program specific data declarations here:
wVar: .word 15
wVar2: .space 4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, wVar 
sw $t0, wVar2
# >>>>> your program code ends
li $v0, 10
syscall
.end main