.data
	prompt1: .asciiz "Enter your name:"
	prompt2: .asciiz "\nHello! "
	name: .space 20
.text
	li $v0,4
	la $a0, prompt1
	syscall
	
	li $v0,8	# to read the string from i/p
	la $a0,name	# $a0 = [name]
	li $a1,20	# $a1 = sizeof [name]
	syscall
	
	li $v0,4
	la $a0,prompt2
	syscall
	
	li $v0,4
	la $a0,name
	syscall