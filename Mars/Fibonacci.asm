.data
array:	.space 100
input1: .asciiz "\nEnter the value of n:"
input: .asciiz "\nEnter the value of i:"
error: .asciiz "\nThe value of i is invalid:"
new: .asciiz "\n"
.text
li $v0, 4
la $a0, input1                                                                                                                                                                                      
syscall                                                                                                                                                                                                          
li $v0, 5                                                                                                                                                                                                 
syscall                                                                                                                                                                                                            
move $s5, $v0 
mul $s0,$s5,4  
  
addi $s9,$zero,$zero
sw $zero, array($s9)
addi $s9,$s9,4
sw 1, array($s9) 
addi $t1,$t1,$zero
addi $t2,$t2,1  
addi $s1,$zero,8 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
while:                                                                                                                                                                                                                                                                                                                                                                                                         
         beq $s1, $s0, print
         addi $t3,$t2,$t1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
         sw $t3, array($s1) 
         addi $t1,$t1,$t2
         addi $t2,$t2,$t3                                                                                                                                                                                                           
         addi $s1, $s1,4                                                                                                                                                                                                
         j while                                                                                                                                                                                                                                                                                                                                                                                                              
 print:                                                                                                                                                                                                                  
        beq $s2, $s0, exit                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
        lw $t0, array($s2)                                                                                                                                                                                 
        li $v0, 1                                                                                                                                                                                                            
        add $a0, $t0, $zero                                                                                                                                                                                                
        syscall                                                                                                                                                                                                           
        li $v0, 4                                                                                                                                                                                         
        la $a0, new                                                                                                                                                                                                           
        syscall                                                                                                                                                                                                   
        addi $s2, $s2, 4                                                                                                                                                                                                           
        j print                                                                                                                                                                                                 
  exit:                                                                                                                                                                                                                   
      