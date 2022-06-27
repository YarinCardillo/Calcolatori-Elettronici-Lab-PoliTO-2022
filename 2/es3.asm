.data
# >>>>> program specific data declarations here:
var1: .word 4
var2: .word 6
var3: .word 0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, var1
lw $t1, var2
lw $t2, var3
ordina1:
blt $t0, $t1, ordina2
move $t3, $t0
move $t0, $t1
move $t1, $t3
ordina2:
blt $t0, $t2, ordina3
move $t3, $t0
move $t0, $t2
move $t2, $t3
ordina3:
blt $t1, $t2, fine
move $t3, $t1
move $t1, $t2
move $t2, $t3
fine:
move $a0, $t0
li $v0, 1
syscall
move $a0, $t1
li $v0, 1
syscall
move $a0, $t2
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main