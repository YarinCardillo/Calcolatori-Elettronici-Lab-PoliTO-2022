.data
# >>>>> program specific data declarations here:
string1: .asciiz "Insert 1st number: "
string2: .asciiz "Insert 2nd number: "
string3: .asciiz "*swap*\n"
string4: .asciiz "1st number: "
string5: .asciiz "2nd number: "
stringBonus: .ascii "\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, string1
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0

la $a0, string2
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0

add $t1, $t1, $t2
sub $t2, $t1, $t2
sub $t1, $t1, $t2

la $a0, string3
li $v0, 4
syscall

la $a0, string4
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall

la $a0, stringBonus
li $v0, 4
syscall

la $a0, string5
li $v0, 4
syscall
move $a0, $t2
li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main