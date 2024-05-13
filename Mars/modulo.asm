.data
 msg1:.asciiz "Enter a number:"
  msg2:.asciiz "your score is:"
 .text 
li $v0, 4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0, 4
la $a0,msg1
syscall

li $v0,5
syscall
move $t1,$v0
jal modN

# print returned valu
li $v0, 1
addi $a0, $v1, 0
syscall
		
li $v0, 10
syscall

## FUNCTION modN ##
modN: 
div $t0,$t1
mfhi $v1  			# calculate return value
jr $ra			        # return

