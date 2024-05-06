.data
	newline: .asciiz "\n"
.text
#using mul	(uses 3 registers)
	addi $t0,$zero,4	# t0 = 4
	addi $t1,$zero,16	# t1 = 16
	
	mul $t2,$t1,$t0		# t2 = t1 * $t0
	
	li $v0,1
	add $a0,$zero,$t2	#a0 = t2
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
#using mult	(uses 2 registers)
	addi $t3,$zero,4	# t3 = 4
	addi $t4,$zero,16	# t4 = 16
	
	mult $t3,$t4		# t3 = t3 * t4
	mflo $t3		# if higher than 32 bit while mul, it gets stored in hi
	
	li $v0,1
	add $a0,$zero,$t3	# a0 = t3
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
#using sll	(same as << in c)
	addi $t5,$zero,4	# t5 = 4
	
	sll $t6,$t5,3		# t6 = 4 * 2^(3)
	
	add $a0,$t6,$zero
	li $v0,1
	syscall
	