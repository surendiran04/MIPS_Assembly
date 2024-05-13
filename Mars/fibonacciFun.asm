.data
array:	.space 40
input: .asciiz "\nEnter a number:"
new: .asciiz "\n"
.text

li $v0, 4
la $a0,input
syscall

li $v0,5
syscall
move $t1,$v0

                                                                                                                                                                                    
addi $t4,$zero,1
subi $t1,$t1,2

 li $v0, 1
 move $a0,$zero
 syscall 
 
 li $v0, 1
 move $a0,$t4
 syscall
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
fib:                                                                                                                                                                                                                                                                                                                                                                                                         
         beq $s1, $t1, exit 
         add $t5,$t3,$t4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
         li $v0, 1
         move $a0,$t5
          syscall   
          add $t3,$zero,$t4
          add $t4,$zero,$t5                                                                                                                                                                                          
         addi $s1, $s1,1                                                                                                                                                                                                
         j fib                                                                                                                                                                                                           
                                                                                                                                                                                                                                                                                                                                                                                                     
 exit:                                                                                                                                                                                                                   
      li $v0, 10                                                                                                                                                                                                 
      syscall                                                                                                                                                                                         
               