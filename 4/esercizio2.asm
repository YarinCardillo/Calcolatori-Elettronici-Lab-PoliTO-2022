.data
# >>>>> program specific data declarations here:
opa: .word 2043
opb: .word 5
res: .space 4
insert: .asciiz "a = 2043; b = 5;\n\n0 = somma; 1 = sottrazione; 2 = moltiplicazione; 3 = divisione;\nInserisci un valore: "
errore: .asciiz "\nErrore"
risultato: .asciiz "\nIl risultato e': "
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t1, opa
lw $t2, opb
la $a0, insert
li $v0, 4
syscall
li $v0, 5
syscall
bgt $v0, 3, error
blt $v0, 0, error
beq $v0, 0, somma
beq $v0, 1, sottrazione
beq $v0, 2, moltiplicazione
beq $v0, 3, divisione
somma:
add $t1, $t1, $t2
b end1
sottrazione:
sub $t1, $t1, $t2
b end1
moltiplicazione:
mul $t1, $t1, $t2
b end1
divisione:
div $t1, $t1, $t2
b end1
error:
la $a0, errore
li $v0, 4
syscall
b end2
end1:
sw $t1, res
la $a0, risultato
li $v0, 4
syscall
move $a0, $t1
li $v0, 1
syscall
end2: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main