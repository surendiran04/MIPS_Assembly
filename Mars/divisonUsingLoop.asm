.data
input: .asciiz "\nEnter two numbers a & b:\n"
new: .asciiz "\n"
.text
li $v0, 4
la $a0,input
syscall

li $v0,5
syscall
move $a1,$v0

li $v0,5
syscall
move $a2,$v0
           
jal fun1
                                                                                                                                                                                                                                                                                                                                                             
li $v0, 1
addi $a0,$v1,0
syscall 

 li $v0, 10
 syscall
 
fun1:
    addi $s1,$a2,0
    addi $v1,$v1,0
   while:
     bgt $s1,$a1,end
     add $s1,$s1,$a2
     addi $v1,$v1,1
     j while
end:
   jr $ra   
     

 

 