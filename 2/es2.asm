.data
# >>>>> program specific data declarations here:
print1: .asciiz "Inserire un intero positivo da 0 a 255:\n"
printErrore: .asciiz "Errore\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:

li $t3, 0xFFFFFF00

insert1:

la $a0, print1
li $v0, 4
syscall

li $v0, 5
syscall

and $t3, $v0, $t3
bne $t3, 0, errore1
move $t0, $v0
j insert2

errore1:
la $a0, printErrore
li $v0, 4
syscall
j insert1

insert2:
li $t3, 0xFFFFFF00
la $a0, print1
li $v0, 4
syscall

li $v0, 5
syscall

and $t3, $v0, $t3
bne $t3, 0, errore2
move $t1, $v0
j next

errore2:
la $a0, printErrore
li $v0, 4
syscall
j insert2

next:
xor $t3, $t0, $t1
not $t1, $t1
and $t0, $t0, $t1
not $t0, $t0
or $t0, $t0, $t3

li $t1, 0x000000FF
and $t0, $t0, $t1
move $a0, $t0

li $v0, 1
syscall
# >>>>> your program code ends
li $v0, 10
syscall
.end main