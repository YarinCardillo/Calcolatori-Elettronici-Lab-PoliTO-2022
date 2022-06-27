.data
# >>>>> program specific data declarations here:
opa: .word 2043
opb: .word 5
res: .space 4
wArray: .word somma, sottrazione, moltiplicazione, divisione
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
lw $t0, opa
lw $t1, opb
li $v0, 5
syscall
bgt $v0, 3, error
blt $v0, 0, error
sll $t2, $v0, 2
lw $t2, wArray($t2)
jr $t2
somma:
add $t0, $t0, $t1
b fine
sottrazione:
sub $t0, $t0, $t1
b fine
moltiplicazione:
mul $t0, $t0, $t1
b fine
divisione:
div $t0, $t0, $t1
b fine
error:
b fine2
fine: sw $t0, res
fine2: nop
# >>>>> your program code ends
li $v0, 10
syscall
.end main