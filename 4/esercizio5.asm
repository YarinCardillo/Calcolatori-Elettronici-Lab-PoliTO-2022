.data
# >>>>> program specific data declarations here:
NUMCOL = 6
NUMRIG = 4
DIMRIG = 4 
wMatrix: .word 154, 123, 109, 86, 4 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
la $t0, wMatrix
li $t1, 1


# >>>>> your program code ends
li $v0, 10
syscall
.end main