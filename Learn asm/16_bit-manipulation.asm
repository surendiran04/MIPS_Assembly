# making the first bit zero in a binary number  e.g 11001 => 11000
.data
	space: .asciiz " "
.text
main:
	li $s0,345		# $s0 | n = number 
	move $a1,$s0		# $a1 | argument to printNum function
	jal printNum
				# $a1 | the same argument to bit 
	jal bit
	
	move $a1,$v0		# $a1 | srgument to printNum as the return value from bit
	jal printNum
	
	li $v0,10		#  to exit the program successfully
	syscall
bit:
	#add $sp,$sp,-4
	#sw $t0,0($sp)

	li $t0,-1		# $t0 | because 1 = 0001 which makes -1 = 1111
	sll $t0,$t0,1		# $t0 | $t0 multiplying by 2 to make last bit 0 (cuz even will end in 0) 
	and $v0,$t0,$a1		# $v0 | $t0 & $a1   
	
	#lw $t0,0($sp)
	#add $sp,$sp,4
	
	jr $ra
printNum:
	li $v0,1
	move $a0,$a1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	jr $ra
