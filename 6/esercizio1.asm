.data
# >>>>> program specific data declarations here:

# >>>>> end declarations
.text
.globl main
.ent main
main:
# >>>>> your program code goes here:
jal stampaTriangolo
jal stampaQuadrato
# >>>>> your program code ends
li $v0, 10
syscall
.end main
stampaTriangolo:
# IN JAVA:
#       char a = '*';
#		int k=0;
#		for(int i=0; i<10; i++) {
#			k++;
#			for(int j=0; j<k; j++)
#				System.out.print(a + " ");
#			System.out.println();
li $v0, 11
li $t0, 0 #int k
li $t1, 0 #int i 
forRighe:
li $a0, '*' #char a
addi $t0, $t0, 1
li $t2, 0 #int j
forColonne:
syscall
addi $t2, $t2, 1
blt $t2, $t0, forColonne
li $a0, '\n'
syscall
addi $t1, $t1, 1
bne $t1, 8, forRighe
jr $ra
.end stampaTriangolo
stampaQuadrato:
li $v0, 11
li $t1, 0 #int i 
forRigheQ:
li $a0, '*' #char a
li $t2, 0 #int j
forColonneQ:
syscall
addi $t2, $t2, 1
blt $t2, 8, forColonneQ
li $a0, '\n'
syscall
addi $t1, $t1, 1
bne $t1, 8, forRigheQ
jr $ra
.end stampaQuadrato