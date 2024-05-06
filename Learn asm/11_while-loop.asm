.data
	space: .asciiz " "
	doneMsg: .asciiz "Completed the loop!\n"
.text
	add $t0,$t0,$zero 			# i=0
	
	while:
		bgt $t0,10,exitLoop	# while(i < 10)
		
		jal printNum		# statements inside while loop
		
		addi $t0,$t0,1		# i++
		j while
		
	printNum:
		move $a0,$t0
		li $v0,1
		syscall 
		
		li $v0,4
		la $a0,space
		syscall
			
		jr $ra			
	exitLoop:
		li $v0,4
		la $a0,doneMsg
		syscall
		
		j after
	after: 				# remaining part of thr code
		li $v0,10		# to exit the program
		syscall