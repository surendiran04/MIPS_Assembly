.data
	newline: .asciiz	"\n"
	array: .word 0:12  #array contains 12 0's initially
.text
main:
	addi $s0,$zero,5
	addi $s1,$zero,10
	addi $s2,$zero,15
	
	addi $t0,$zero,0  # $t0 = i 
	
	sw $s0,array($t0)
	   addi $t0,$t0,4 #incrementing index by 4
	sw $s1,array($t0)
	  addi $t0,$t0,4
	sw $s2,array($t0)
	
while:
	 bgt $t1,$t0,exit
	 lw $a0,array($t1)
	 jal print
	 addi $t1,$t1,4
	 j while
	
exit:		
	li $v0,10
	syscall
						
					
print:
	li $v0,1
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
	
	jr $ra

