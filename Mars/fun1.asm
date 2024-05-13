.data
	message: .asciiz "Hello World!!!"
.text
	main: 
		jal displayMessage		# call function displayMessage
		
	 li $v0, 10					# indicate end of program
	 syscall

displayMessage: 
	li $v0, 4					
	la $a0, message
	syscall
	jr $ra						# return to caller
