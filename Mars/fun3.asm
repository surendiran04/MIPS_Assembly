.data

.text
	main: 
		addi $a0, $zero, 10			# argument for procedure
		jal incVal				# Call procedure
		
	## end of program ##	
	  li $v0, 10
	  syscall


	## FUNCTION to increment value and print ##
	incVal:
		addi $a0, $a0, 1			# argument for nested procedure

		addi $sp, $sp, -4			# allocate space for storing $ra
		sw $ra, 0($sp)				# store previous return address in stack
		
		jal printVal				# Nested Procedure call
		
		lw $ra, 0($sp)				# restore return address of caller
		addi $sp, $sp, 4			# deallocate space in stack
		
		jr $ra					# return 


	## FUNCTION to print value	##
	printVal:
		li $v0, 1
		syscall					# $a0 is argument
		jr $ra					# return
