.data
# >>>>> program specific data declarations here:

# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
li $t0, 10
li $t1, 0xdc
# >>>>> your program code ends
li $v0, 10
syscall
.end main