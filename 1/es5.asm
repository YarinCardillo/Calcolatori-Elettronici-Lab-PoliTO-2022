.data
# >>>>> program specific data declarations here:
print0: .asciiz "Inserire numero: "
print1: .asciiz "A = "
print2: .asciiz "B = "
acapo: .ascii "\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, print0
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0

la $a0, print0
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0

la $a0, acapo
li $v0, 4
syscall

la $a0, print1
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

la $a0, acapo
li $v0, 4
syscall

la $a0, print2
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall

add $t1, $t1, $t2
sub $t2, $t1, $t2
sub $t1, $t1, $t2

la $a0, acapo
li $v0, 4
syscall

la $a0, acapo
li $v0, 4
syscall

la $a0, print1
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

la $a0, acapo
li $v0, 4
syscall

la $a0, print2
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main