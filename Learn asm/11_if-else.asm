.data
	prompt1: .asciiz "Lesser than the other"
	prompt2: .asciiz "Greater than the other"
.text
main:
	li $t0,30
	li $t1,20
	
	# Branch instructions
	slt $s0,$t0,$t1		# if( $t1 < $t2 ) $s0 = 1 else $s0 = 0
	bne $s0,$zero,less	# if( $s0 == 0 ) branch to label
	
	#Pseudo Branch instructions
	#blt $t0,$t1,less  	# equivalent to slt & bne

	li $v0,4		# else part
	la $a0,prompt2
	syscall
	
	j after
less:
	li $v0,4
	la $a0,prompt1
	syscall
	
	j after

after:				# remaining part of thr code
	li $v0,10		#to exit the program
	syscall
