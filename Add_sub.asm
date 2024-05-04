.data
 num1: .word 10
 num2: .word 6
 newline: .asciiz "\n"
 
.text
   main:
 lw $t0,num1   #both the methods gives the same output but diifers in the way the address is calculated
 lw $t1,num2($zero)
 
 add $t2,$t1,$t0
 
 li $v0,1
 add $a0,$t2,$zero
 syscall
 
 li $v0,4
 la $a0,newline
 syscall
 
 sub $t3,$t0,$t1
 
 li $v0,1
 move $a0,$t3
 syscall
#ends the program
li $v0,10
syscall 
