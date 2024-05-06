.data
	size: .asciiz "Enter the no. of terms:"
	ans1: .asciiz "F_"
	ans2: .asciiz " = "
	endl: .asciiz "\n"
.text
main:
	li $v0,4
	la $a0,size
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	li $t0,0	#i=0
	
	loop:	
		beq $t0,$s0,exit	#while(i<=n)
		
		move $a0,$t0		# i as argument to fib(n)
		jal fib
		move $a1,$v0		# return value as argument to function printf
		
		jal printf
		
		add $t0,$t0,1		# i++
		j loop
exit:
	li $v0,10	# to exit the program gracefully
	syscall
printf:
	li $v0,4
	la $a0,ans1	# F_
	syscall
	
	move $a0,$t0	# i
	li $v0,1	
	syscall
	
	li $v0,4
	la $a0,ans2	# = 
	syscall
	
	move $a0,$a1
	li $v0,1  	# print fib(i)
	syscall
	
	li $v0,4
	la $a0,endl	# \n
	syscall
	
	jr $ra
fib:
	beqz $a0,zero	# if(n == 0) 
	beq $a0,1,one	# else if(n == 1)
	
    #------------ fib(n-1) ---------------#
	sub $sp,$sp,4
	sw $ra,0($sp)
	
	sub $a0,$a0,1	# n-1 as argument to fib(n)
	jal fib		# fib(n-1)
	add $a0,$a0,1	# restore the value of $a0 to original
	
	lw $ra,0($sp)
	add $sp,$sp,4
   #------------------------------#
	sub $sp,$sp,4
	sw $v0,0($sp)	# push return value of fib(n-1) 
   #----------- fib(n-2) ---------------#
	sub $sp,$sp,4
	sw $ra,0($sp)
	
	sub $a0,$a0,2	# n-2 as argument to fib(n)
	jal fib		# fib(n-2)
	add $a0,$a0,2	# restore the value of $a0 to original
	
	lw $ra,0($sp)
	add $sp,$sp,4
   #------------------------------#
	lw $s1,0($sp)	# pop return value of fib(n-1) 
	add $sp,$sp,4
	
	# $s1 -> return value of fib(n-1)
	# $v0 -> return value of fib(n-2)
	
	add $v0,$v0,$s1		# return fib(n-1) + fib(n-2)
	jr $ra
zero:
	li $v0,0	# return 0
	jr $ra
one:
	li $v0,1	# return 1
	jr $ra
