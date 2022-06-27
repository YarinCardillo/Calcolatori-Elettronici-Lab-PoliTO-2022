.data
	vett: .word 5, 7, 3, 4, 3
	result: .word 0
	.text
	.globl main
	.ent main
	main:
	
			la $t3, vett 					# load address of vett
			and $t4, $0, $0 				# temporary register = 0
			lw $t0, ($t3) 					# load first element from vett
			add $t4, $t4, $t0 				# add to the temp register
			addi $t3, $t3, 4 				# update index
			lw $t0, ($t3) 					# load first element from vett
			add $t4, $t4, $t0 				# add to the temp register
			addi $t3, $t3, 4 				# update index
			lw $t0, ($t3) 					# load first element from vett
			add $t4, $t4, $t0 				# add to the temp register
			addi $t3, $t3, 4 				# update index
			lw $t0, ($t3) 					# load first element from vett
			add $t4, $t4, $t0 				# add to the temp register
			addi $t3, $t3, 4 				# update index
			lw $t0, ($t3) 					# load first element from vett
			add $t4, $t4, $t0 				# add to the temp register
			la $t3, result
			sw $t4, ($t3) 					# write result to memory
	

		syscall
	.end main