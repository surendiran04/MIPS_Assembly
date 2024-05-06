.data
	size: .asciiz "\nEnter the size:"
	prompt: .asciiz "Enter a number:"
	df: .byte 4
	arr: .space 100
.text
	li $v0,4
	la $a0,size
	syscall
	
	li $v0,5
	syscall
	move $s0, $v0			# $s0 | size = n
	
	li $v0,9
	mul $a0, $s0, 4			# to indicate dynamic memory allocation of size n
	syscall				# returns a address
	
	move $s4, $v0			# $s4 | store the starting address
	move $s6, $v0			# $s6 | temp of $s4
	mul $s5, $s0, 4			# $s5 | total size of array
	add $s5, $s5, $s4		# $s5 | starting address + ending address
		
	li $t0,0			# $t0 | i = 0
	li $t1,0			# $t1 | index = 0
	
	iploop:
		beq $s4,$s5,exit	# while(i < n)
		
		li $v0,4
		la $a0,prompt
		syscall
		
		li $v0,5
		syscall
		move $s2,$v0		# $s2 = input number
		
		sw $s2,($s4)		# arr[i] = input number	
		addi $s4, $s4, 4	# $s4 | i++														# i++
		j iploop
		
	exit:
		li $v0,10
		syscall
		
	
