.data
	prompt:	.asciiz	"Hello Everybody, I'm Krisna\n"
	newline: .asciiz "\n"
.text
main:
	addi $a1,$zero,1	# argument1 to addnum
	addi $a2,$zero,2	# argument2 to addnum
#function1	
	jal addnum		# to jump to the desired function
	
	li $v0,1
	addi $a0,$v1,0		# $a0 = $v1
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
#function2
	jal display		#to jump to the desired function	(like function call)
	
#to exit the program
	li $v0,10
	syscall
display:	#function declaration
	li $v0,4
	la $a0,prompt
	syscall
	
	jr $ra 
addnum:		#function declaration
	add $v1,$a1,$a2
	
	jr $ra
