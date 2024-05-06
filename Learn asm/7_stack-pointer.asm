.data
	newline: .asciiz "\n"
.text
main: 
	addi $s0,$zero,10	# $s0 = 10
	
	li $v0,1
	add $a0,$zero,$s0	# $a0 = $s0
	syscall
	
	li $v0,4
	la $a0,newline		# newline
	syscall
	
	jal increment		# jumps to function

	li $v0,10		# to exit successfully
	syscall
increment:
#stack pointer init
	addi $sp,$sp,-4		# init stack pointer with sizeof s1 word
	sw $s0,0($sp)		# $sp = $s0

	addi $s0,$s0,1		# $s0 = $s0+1
	
	li $v0,1
	add $a0,$zero,$s0	# $a0 = $s0
	syscall
#stack pointer restore	
	lw $s0,0($sp)
	addi $sp,$sp,4		# reinit stack pointer to original value to access in main fn
	
	li $v0,4
	la $a0,newline		# newline
	syscall
	
	jr $ra
