.data
  msg1:.asciiz "Enter a integer number:\n"
  msg2:.asciiz "the addition two numbers is:"
 .text 
li $v0, 4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,5
syscall
move $t1,$v0

li $v0, 4
la $a0,msg2
syscall

li $v0,1
add $a0,$t0,$t1
syscall