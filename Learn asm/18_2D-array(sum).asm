.data
	arr: .word 4,2,7,45
	     .word 4,49,8,11
	     .word 7,8,9,10
	     .word 3,8,2,8
	size: .word 4
	.eqv INT_SIZE 4
.text
	main:
		la $s0,arr	# base address
		lw $t0,size	# row = col = size
		li $s1,0	# sum = 0
		
		jal diag_sum	# calling function
		
		move $a0,$v0	# storing return value		
		li $v0,1
		syscall
		
		li $v0,10	# to exit the program
		syscall

	diag_sum:
		li $t1,-1			# i = -1
		i_loop:
			addi $t1,$t1,1		# ++i
			beq $t1,$t0,exit	# i < row
			li $t2,-1		# j = -1
			
			j_loop:
				addi $t2,$t2,1		#++j
				beq $t2,$t0,i_loop	# j < col
				
				mul $t3,$t1,$t0		# i * colsize
				add $t3,$t3,$t2		# (i * colsize) + j
				mul $t3,$t3,INT_SIZE	# $t3 | ((i * colsize) + j) * 4
				add $t3,$t3,$s0		# base address + $t3
				
				lw $s2,($t3)		# $s2 | a[i][j]
				
				add $t3,$t1,$t2		# $t4 | i + j
				sub $t4,$t0,1		# $t5 | n-1 
				seq $t3,$t3,$t4		# $t4 | (i+j == n-1)
				seq $t4,$t1,$t2	 	# $t5 | (i == j)
				or $t4,$t3,$t4		# if((i==j)||(i+j<n-1))
				
				bnez $t4,sum
				
				j j_loop
			j i_loop
	sum:
		add $s1,$s1,$s2		# sum = sum + a[i][j]
		j j_loop
		
	exit:
		move $v0,$s1
		jr $ra	
		
		
