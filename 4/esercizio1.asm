.data
# >>>>> program specific data declarations here:
NUM_ELEM = 20
DIM = 4 * NUM_ELEM
wArray: .space  DIM
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 0
li $t1, 1
sw $t1, wArray($t0)
addi $t0, $t0, 4
li $t2, 1
sw $t2, wArray($t0)
addi $t0, $t0, 4
loop:
add $t3, $t1, $t2
sw $t3, wArray($t0)
move $t1, $t2
move $t2, $t3
addi $t0, $t0, 4
blt $t0, DIM, loop
# >>>>> your program code ends
li $v0, 10
syscall
.end main