.data
	newline:	.asciiz		"\n"
	space:		.asciiz		"	"
.text
#using div	(using 3 registers)
	addi $t0,$zero,2520	# $t0 = 2520
	addi $t1,$zero,7	# $t1 = 7
	
	div $t2,$t0,$t1		# $t2 = 2520/7
	
	add $a0,$zero,$t2	# $a0 = $t2
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
#using div	(using 2 registers)
	addi $t2,$zero,2520	# $t2 = 2520
	addi $t3,$zero,11	# $t3 = 11
	
	div $t2,$t3
	
	mflo $s0	#s0 = quotient
	mfhi $s1	#s1 = remainder
	
	add $a0,$zero,$s0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	add $a0,$zero,$s1
	li $v0,1
	syscall