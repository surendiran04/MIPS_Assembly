.data
	num1: .word 1
	num2: .word 2
.text
	lw $t0, num1	# t0 = 1
	lw $t1, num2	# t1 = 2
	
	li $v0,1
	add $a0,$t0,$t1	# a0 = t0 + t1
	syscall
	
	move $t2,$a0