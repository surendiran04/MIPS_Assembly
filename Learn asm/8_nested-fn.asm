.data
	newline:	.asciiz	"\n"
.text
main:
	addi $s0,$zero,10
	
	jal print
	
	jal increment
	
	li $v0,10	#to exit the program
	syscall
	
increment:
	addi $sp,$sp,-8		# init stack with sizeof 2 words
	sw $s0,0($sp)		# stack[0] = $s0
	sw $ra,4($sp)		# stack[1] = $ra

	addi $s0,$s0,1
	
	# nested function
	jal print
	
	lw $s0,0($sp)		
	lw $ra,4($sp)
	addi $sp,$sp,8		# restore the stack
	
	jr $ra
	
print:
	li $v0,1
	addi $a0,$s0,0
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
	
	jr $ra