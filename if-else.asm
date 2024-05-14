.data 
	positiveMsg:	.asciiz "positive\n"
	negativeMsg:	.asciiz "negative\n"
	zeroMsg:	.asciiz	"zero\n"
	doneMsg:	.asciiz "Done!!"
.text 
	# store a constant integer in $t0
	addi $t0, $zero, -10

	sgt $t1, $t0, $zero		# set $t1 if $t0 > 0
	bne $t1, $zero, positive	# branch if $t1 != 0 i.e. $t1 = 1 i.e. $t0 > 0
	slt $t1, $t0, $zero		# set $t1 if $t0 < 0
	bne $t1, $zero, negative	# branch if $t1 != 0 i.e. $t1 = 1 i.e. $t0 < 0

	####### ELSE ######
	# Print "zero"
	li $v0, 4
	la $a0, zeroMsg
	syscall
	
	j after
		
positive:	######## IF #########
	# Print "positive"
	li $v0, 4
	la $a0, positiveMsg
	syscall
	j after

negative:	####### ELSE IF $#######
	# Print "negative"
	li $v0, 4
	la $a0, negativeMsg
	syscall
	j after
	
after:
	# Print "Done"
	li $v0, 4
	la $a0, doneMsg
	syscall
	