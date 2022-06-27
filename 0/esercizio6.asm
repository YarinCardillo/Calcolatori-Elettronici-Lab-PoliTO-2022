.data
# >>>>> program specific data declarations here:
DIM = 10
wArray: .space 44
print1: .asciiz "Insert numbers\n"
print2: .asciiz "Your numbers\n"
space: .ascii "; "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
print1here:
la $a0, print1
li $v0, 4
syscall

arrayAddressing1:
la $t0, wArray
li $t1, 0

arrayGetterLoop:
li $v0, 5
syscall
sw $v0, ($t0)
beq $t1, DIM, print2here
add $t1, $t1, 1
add $t0, $t0, 4
j arrayGetterLoop

print2here:
la $a0, print2
li $v0, 4
syscall

arrayAddressing2:
la $t0, wArray
li $t1, 0

arrayPrinterLoop:
li $v0, 1
lw $a0, ($t0)
syscall
beq $t1, DIM, end
la $a0, space
li $v0, 4
syscall
add $t1, $t1, 1
add $t0, $t0, 4
j arrayPrinterLoop

end: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main