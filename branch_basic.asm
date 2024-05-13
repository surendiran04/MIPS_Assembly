.data
	newline:	.asciiz	"\n"
	text: .asciiz "Condition failed"
.text
main:
	addi $s0,$zero,0
	addi $s1,$zero,15
	bgt $s0,$s1,print # similarly wecan use ble,blt,bgt,bge,beg,bne
	beqz $s0,print 
	li $v0,4
	la $a0,text
	syscall
	
	li $v0,10	# To exit the program
	syscall
				
print:
	li $v0,1
	addi $a0,$s0,0
	syscall
	
	li $v0,4
	la $a0,newline
	syscall
