.data
	arr1: .word 1,0,0,0,1,0,0,0,1
	arr2: .word 1,0,0,0,1,0,0,0,1
	#arr1:	.word 1,2,3,4,5,6,7,8,9
	#arr2:	.word 1,2,3,4,5,6,7,8,9
	arr3:	.word 0:10
	size: .word 3
	.eqv INT_SIZE 4
	space: .asciiz "  "
	endl: .asciiz "\n"
.text
main:
	lw $s0,size	# $s0 | size
	li $s4,0	# $s4 | sum
	
	li $t0,-1	# $t0 | i = -1
	iloop:
		add $t0,$t0,1 		# ++i
		beq $t0,$s0,printloop	# while(i < n)		
		li $t1,-1	# $t1 |  j = -1
		jloop:
			add $t1,$t1,1	# ++j
			beq $t1,$s0,iloop	# while(j < n)
			
			li $s4,0	#  sum = 0
			li $t2,-1	# $t2 | k = -1
			kloop:
				add $t2,$t2,1	# ++k
				beq $t2,$s0,jloop # while (k < n)
				
				mul $s1,$t0,$s0		# i * n
				add $s1,$s1,$t2		# (i * n) + k
				mul $s1,$s1,INT_SIZE	# ((i * n) + k) * sizeof(INT)
				
				mul $s2,$t2,$s0		# k * n
				add $s2,$s2,$t1		# (k * n) + j
				mul $s2,$s2,INT_SIZE	# ((k * n) + j) * sizeof(INT)
				
				mul $s3,$t0,$s0		# i * n
				add $s3,$s3,$t1		# (i * n) = j
				mul $s3,$s3,INT_SIZE	# ((i * n) = j) * sizeof(INT)
				
				lw $s5,arr1($s1)	# $s5 | arr1[i][k]
				lw $s6,arr2($s2)	# $s6 | arr2[k][j]
				
				mul $s7,$s5,$s6		# $s7 | arr1[i][k] * arr2[k][j]
				add $s4,$s4,$s7		# $s4 | sum += arr1[i][k] * arr2[k][j]
				sw $s4,arr3($s3)	# $s4 | $s4 = arr3[i][j]

				j kloop
			j jloop
		j iloop
		
printloop:
	li $t0,-1	# i = -1
	i2loop:
		add $t0,$t0,1		# ++i
		beq $t0,$s0,exit	# while(i < n)
		li $t1,-1		# j = -1
		
		li $v0,4
		la $a0,endl	# newline
		syscall
		
		j2loop:
			add $t1,$t1,1		# ++j
			beq $t1,$s0,i2loop	# while( j < n)
			
			mul $t2,$t0,$s0		# i * n
			add $t2,$t2,$t1		# (i * n) = j
			mul $t2,$t2,INT_SIZE	# ((i * n) = j) * sizeof(INT)

			lw $s1,arr3($t2)	# $s1 | arr3[i][j]
			move $a0,$s1		
			li $v0,1
			syscall
		
			li $v0,4
			la $a0,space
			syscall	
			
			j j2loop
		j i2loop
exit:
	li $v0,10
	syscall
