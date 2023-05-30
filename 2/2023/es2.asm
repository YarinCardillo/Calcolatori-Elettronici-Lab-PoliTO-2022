.data
# >>>>> program specific data declarations here:
print1: .asciiz "Inserire numero tra 0 e 255\n"
print_errore: .asciiz "Errore\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
A:
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
and $t0, $v0, 0xFFFFFF00 
bne $t0, $0, errore1
move $t1, $v0
B:
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
and $t0, $v0, 0xFFFFFF00 
bne $t0, $0, errore2
move $t2, $v0
not $t3, $t2
and $t4, $t1, $t3
not $t4, $t4
xor $t1, $t1, $t2
or $t4, $t4, $t1
j fine
errore1:
la $a0, print_errore
li $v0, 4
syscall
j A
errore2:
la $a0, print_errore
li $v0, 4
syscall
j B
fine: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main