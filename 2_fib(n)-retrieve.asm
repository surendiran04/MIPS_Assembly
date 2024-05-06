.data
	size: .asciiz "Enter the no. of terms:"
	arr: .word 0:100	# arr[100] = {0}
	space: .asciiz " "
	term: .asciiz "\nEnter the term no.:"
.text
	li $v0,4
	la $a0,size
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0		# $s0 | size
	
	li $t0,0		# term1
	li $t1,1		# term2
	li $t2,0		# term3
	li $s1,0		# i = 0
	
	fib:
		beq $s1,$s0,after	# i < n
		
		move $a1,$t2		# argument to function
		jal cout
		
		sll $s1,$s1,2		# i*4
		sw $t2,arr($s1)		# arr[index] = term3
		srl $s1,$s1,2		# i/4
		
		move $t0,$t1
		move $t1,$t2
		add $t2,$t0,$t1
		
		addi $s1,$s1,1		# i++
		j fib
	cout:
		move $a0,$a1
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,space
		syscall
		
		jr $ra
	after:
	 	li $v0,4
	 	la $a0,term
	 	syscall
	 	
	 	li $v0,5
	 	syscall
	 	move $s2,$v0
	 	
	 	mul $s2,$s2,4
	 	lw $a0,arr($s2)
	 	li $v0,1
	 	syscall
	 	
	li $v0,10
	syscall


	
