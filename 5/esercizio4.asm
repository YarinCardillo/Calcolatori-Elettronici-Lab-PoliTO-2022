DIM = 5
NEXT_COL = 4
NEXT_ROW = 4*DIM
NEXT_DIAG = 4*(DIM+1)

.data
# >>>>> program specific data declarations here:
matrix: .word 1, 0, 0, 0, 0
        .word 0, 2, 0, 1, 0
        .word 0, 0, 3, 0, 0
        .word 0, 1, 0, 4, 0
        .word 0, 0, 0, 0, 5
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $t0, matrix #puntatore a elemento su diagonale
li $t1, DIM-1 #$t1, contatore ciclo esterno
li $a0, 2 #$a0 risultato (ipotesi iniziale: matrice diagonale)
ciclo1:
move $t2, $t1 #$t2 contatore ciclo interno
move $t3, $t0 #puntatore a elementi su riga
move $t4, $t0 #puntatore a elementi su colonna
ciclo2:
addiu $t3, $t3 NEXT_COL
addiu $t4, $t4, NEXT_ROW
lw $t6, ($t3)
beq $t6, 0, next
li $a0, 1 #non e' diagonale
next: 
lw $t7, ($t4)
bne $t6, $t7, no_simm  #se non e' simmetrica (ne' diagonale), esco dal ciclo
sub $t2, $t2, 1
bne $t2, 0, ciclo2

addiu $t0, $t0, NEXT_DIAG
sub $t1, $t1, 1
bne $t1, 0, ciclo1

b fine 
no_simm:
li $a0, 0

fine: 
li $v0, 1
syscall


# >>>>> your program code ends
li $v0, 10
syscall
.end main