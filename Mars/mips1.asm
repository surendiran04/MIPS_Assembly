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
la $a0,msg2
syscall

li $v0,1
move $a0,$t0
syscall
