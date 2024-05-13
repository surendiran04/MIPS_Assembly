.data
	
.text
	main: 
		addi $a1, $zero, 10			# argument 1
		addi $a2, $zero, 100			# argument 2
		jal addN				# call function
		
		# print returned value
		li $v0, 1
		addi $a0, $v1,0
		syscall
		
	 li $v0, 10
	 syscall

	## FUNCTION addN ##
	addN: 
		add $v1, $a1, $a2			# calculate return value
		jr $ra					# return
