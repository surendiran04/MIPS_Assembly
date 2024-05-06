.data
	arr1: .word 1,2,3
	      .word 4,5,6
	      .word 7,8,9
	arr2: .word 1,2,3
	      .word 4,5,6
	      .word 7,8,9
	arr3: .word 0:100
	size: .word 3
	.eqv INT_SIZE 4
	space: .asciiz " "
	endl: .asciiz "\n"
.text
main:
	lw $s0,size
	
	li $t0,-1
	iloop:
		addi $t0,$t0,1
		beq $t0,$s0,printloop
		
		li $t1,-1
		jloop:
			addi $t1,$t1,1
			beq $t1,$s0,iloop
			
			mul $t2,$t0,$s0
			add $t2,$t2,$t1
			mul $t2,$t2,INT_SIZE
			
			lw $s1,arr1($t2)
			lw $s2,arr2($t2)
			
			add $s1,$s2,$s1
			sw $s1,arr3($t2)
			
			j jloop
		j iloop
printloop:
	li $t0,-1
	i2loop:
		addi $t0,$t0,1
		beq $t0,$s0,exit
		li $t1,-1
		
		li $v0,4
		la $a0,endl
		syscall
		
		j2loop:
			addi $t1,$t1,1
			beq $t1,$s0,i2loop
			
			mul $t2,$t0,$s0
			add $t2,$t2,$t1
			mul $t2,$t2,INT_SIZE

			lw $s1,arr3($t2)
			move $a0,$s1
			jal printNum
			
			j j2loop
		j i2loop
	printNum:
		li $v0,1
		syscall
		
		li $v0,4
		la $a0,space
		syscall	
		
		jr $ra
exit:
	li $v0,10
	syscall	
	
		