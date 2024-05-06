.data
	arr: .word 1,5,9,4,5
	length: .word 5
	endl: .asciiz "\n"
.text
	lw $s0,length		# length
	la $s1,arr		# base address
	li $t0,0		# i = 0
	li $t1,0		# sum = 0 
	
	#do-while loop
	loop:
		lw $t2,($s1) 		# $t2 | arr[index]
		add $t1,$t1,$t2		# sum = sum + arr[index]
		
		addi $t0,$t0,1		# i++
		addi $s1,$s1,4		# index+=4
		blt $t0,$s0,loop	#while( i < n )
		
	move $s2,$t1
	li $v0,1
	move $a0,$t1		# sum
	syscall
		
	li $v0,4
	la $a0,endl
	syscall
		
	div $s3,$s2,$s0
	move $a0,$s3		# average
	li $v0,1
		syscall
		
	