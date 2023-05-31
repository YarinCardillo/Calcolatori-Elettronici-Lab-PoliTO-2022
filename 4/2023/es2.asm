.data
# >>>>> program specific data declarations here:
opa: .word 2043
opb: .word 5
print1: .asciiz "Scegli operazione: +(0) -(1) *(2) /(3)\n"
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $a0, print1
li $v0, 4
syscall
li $v0, 5
syscall
lw $t0, opa
lw $t1, opb
beq $v0, 0, somma
beq $v0, 1, sottrazione
beq $v0, 2, moltiplicazione
beq $v0, 3, divisione
j fine
somma:
add $t0, $t0, $t1
j fine
sottrazione:
sub $t0, $t0, $t1
j fine
moltiplicazione:
mul $t0, $t0, $t1
j fine
divisione:
div $t0, $t0, $t1
fine: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main