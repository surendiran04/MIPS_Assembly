.data
 msg: .asciiz "Hello world!\nYou're welcome\n"
 
.text
   main:
   jal displaymsg
   
   add $a1,$zero,100    #a registers are argument registers
   add $a2,$zero,50
   
   jal addno
   
   li $v0,1
   addi $a0,$v1,0
   syscall
   #ends the program
   li $v0,10
   syscall 

 displaymsg:
  li $v0,4
  la $a0,msg
  syscall
  jr $ra
  
  addno:
  add $v1,$a1,$a2
  jr $ra
 

