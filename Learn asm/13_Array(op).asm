.data
	newline: .asciiz " "
	arr: .word 1,2,3,4
	size: .word 4
	
.text
main:
	lw $s0,size		# $s0 | size = n
	li $t0,-1		# $t0 | i = 0
	li $t1,0		# $t1 | index = 0
	
	oploop:
		addi $t0,$t0,1
		bge $t0,$s0,exit
		
		lw $s1,arr($t1)
		move $a0,$s1
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,newline
		syscall
		
		
		addi $t1,$t1,4
		j oploop		
	exit:
		li $v0,10
		syscall
