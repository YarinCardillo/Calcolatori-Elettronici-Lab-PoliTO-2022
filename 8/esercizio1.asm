.data
# >>>>> program specific data declarations here:
ora_in: .byte 12, 47
ora_out: .byte 18, 14
x: .byte 1
y: .byte 40
# >>>>> end declarations
.text
.globl main
.ent main
main:
subu $sp, 4
sw $ra, ($sp)
# >>>>> your program code goes here:
la $a0, ora_in
la $a1, ora_out
lbu $a2, x
lbu $a3, y
jal costoParcheggio
# >>>>> your program code ends
lw $ra, ($sp)
jr $ra
.end main

costoParcheggio:
# $t0 = (18 x 60) + 14
# $t1 = (12 x 60) + 47
# $t0 = $t0 - $t1
# $t0/40 = costo in euro senza resto
# se il resto e' diverso da zero, al costo aggiungo 1
# salvo il costo in $v0
li $t0, 60
multu ($a1), $t0
mflo $t0
addu $t0, $t0, 1($a1)
.end costoParcheggio








