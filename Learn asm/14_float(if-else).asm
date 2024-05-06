.data
	true: .asciiz "It is equal"
	false: .asciiz "It is not equal"
	num1: .float 3.14
	num2: .float 3.14
.text
main:
	lwc1 $f0, num1		# use even number just in case it's easier to change to double
	lwc1 $f2, num2
	
	c.eq.s $f0,$f2		# compare and check equal if $f0 == $f2 (float) | c.eq.d => for double
	
	bc1t msg		# branch if coprocessor is true | (bc1f) for false
	
	li $v0,4		# else part
	la $a0,false
	syscall
	
	li $v0,10		# to exit the program successfully
	syscall
	
msg:				# if ( $f0 == $f2)
	li $v0,4
	la $a0,true
	syscall