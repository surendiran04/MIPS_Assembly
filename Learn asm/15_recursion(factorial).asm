.data
	input: .asciiz "Enter the number:"
	result: .asciiz "The factorial is:"
.text
main:
#input
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0		# $s0 | input number
	move $a1,$s0		# $a1 | argument to function
		
	jal fact		# calling the function fact(n) ($a0 = n)	
	
#$v0 always returns the value (here from the function), so storing result

	move $s1,$v0		# $s1 | storing the return value
	
#result	
	li $v0,4
	la $a0,result
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,10		# to exit the program
	syscall
	
#function declaration
fact:
	subu $sp,$sp,8 
	sw $ra,0($sp)
	sw $t0,4($sp)		# $t0 | temporary local variable
	
# if(n == 0) retrun 1
	li $v0,1		# return 1 if argument is 0
	beq $a1,0,done		# checks if argument passed is equal to zero
	
	move $t0,$a1
	sub $a1, $a1, 1		# reducing the argument by 1
	jal fact		# fact(n - 1)
#else return n * fact(n -1)	
	mul $v0, $t0, $v0	# only gets executed at last 
	
	done:			# just to restore the stack created by the recursion
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		addu $sp,$sp,8
		
		jr $ra
	
	
	 