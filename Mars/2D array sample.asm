.data
	arr:		.word		1, 2, 3
			.word		4, 5, 6
			.word		10, 9, 8
			.word		7, 6, 5
	numCol: 	.word		3
	numRow:		.word		4
	str:		.asciiz		"\nNew value: "
.text
	addi $t1, $zero, 3		# row index = 3 in $t1
	addi $t2, $zero, 1		# column index = 2 in $t2
	lw $t3, numCol			# load number of columns in $t3
	mul $t1, $t3, $t1		# $t3 = number of columns * row index
	add $t1, $t2, $t1		# $t1 = number of columns * row index + column index
	mul $t1, $t1, 4			# $t1 = (number of columns * row index + column index) * 4
	
	# print element in arr[3][2]
	lw $a0, arr($t1)
	li $v0, 1
	syscall
	
	# store 100 in arr[3][2]
	addi $t0, $zero, 100
	sw $t0, arr($t1)
	
	# print string
	li $v0, 4
	la $a0, str
	syscall
	
	# print new value in arr[3][2]
	lw $a0, arr($t1)
	li $v0, 1
	syscall
	
	
	
	
	
	