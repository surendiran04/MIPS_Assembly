.data
	prompt1: .asciiz "Enter num1:\n"
	prompt2: .asciiz "Enter num2:\n"
.text
	li $v0,4
	la $a0,prompt1
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0	# t0 = v0
	
	li $v0,4
	la $a0,prompt2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0	# t1 = v0
	
	add $a0,$t1,$t0	#a0 = t0 + t1
	li $v0,1
	syscall