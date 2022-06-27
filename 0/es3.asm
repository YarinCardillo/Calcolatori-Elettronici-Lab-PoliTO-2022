.data
# >>>>> program specific data declarations here:
wOpd1: .word 52
wOpd2: .word 24
wResult: .space 4
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:

la $t0, wOpd1
lw $t1, ($t0)
la $t0, wOpd2
lw $t2, ($t0)

add $t0, $t1, $t2
la $t1, wResult
sw $t0, ($t1)

# >>>>> your program code ends
li $v0, 10
syscall
.end main