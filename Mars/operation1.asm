.data
  msg1:.asciiz "Enter a Year:"
  leap_year:.asciiz "Leap year:"
  not_leap_year:.asciiz "Not a Leap Year"
  doneMsg:	.asciiz "\nDone!!"
.text 

li $v0, 4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

addi $t1,$zero,4
div $t0, $t1	
mfhi $t2

addi $t3,$zero,100
div $t0, $t3	
mfhi $t4

addi $t5,$zero,400
div $t0, $t5
mfhi $t6

addi $t7,$zero,1

beq $t6,$zero,leap  #yeat%400
bne $t4,$zero,condition #!year%100
li $v0, 4
la $a0,not_leap_year
syscall
j after

condition:
beq $t2,$zero,leap #year%4
li $v0, 4
la $a0,not_leap_year
syscall
j after

leap:
li $v0, 4
la $a0,leap_year
syscall
j after

after:
	# Print "Done"
	li $v0, 4
	la $a0, doneMsg
	syscall

