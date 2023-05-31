.data
# >>>>> program specific data declarations here:
DIM_RIGHE = 4
DIM_COLONNE = 6
matrix: .word 154, 123, 109, 86, 4,  0, 
			  412, -23, -231, 9, 50, 0, 
			  123, -24, 12, 55, -45, 0, 
			  0,    0,  0,  0,   0,  0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 0
li $t2, 0 #accumulatore

external_loop_in:

internal_loop:
lw $t3, matrix($t0)
add $t2, $t2, $t3
addi $t0, $t0, 4

bne $t0    internal_loop
external_loop_out:

# >>>>> your program code ends
li $v0, 10
syscall
.end main