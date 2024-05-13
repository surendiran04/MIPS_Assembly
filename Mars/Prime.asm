.data
  msg1:.asciiz "Enter a number:"
  yes:.asciiz "The entered number is a prime number:"
  no:.asciiz "The entered mumber is not a prime number"
 .text 
li $v0, 4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

while:                                                                                                                                                                                                                                                                                                                                                                                                         
         bgt $s1, $t0, prime
         addi $s1, $s1,1 
         div $t0,$s1
         mfhi $v1 
         beq $v1,$zero,count
         j while
         
count:
         addi $t1,$t1,1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
         j while 
         
prime: 
beq $t1,2,isprime
li $v0, 4
la $a0,no
syscall
li $v0, 10
syscall	
                
     
isprime:             
li $v0, 4
la $a0,yes
syscall
li $v0, 10
syscall	



