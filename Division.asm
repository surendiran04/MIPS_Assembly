.data
 num1: .word 101
 num2: .word 2
 newline: .asciiz "\n"
 
.text
   main:
 lw $t0,num1   #both the methods gives the same output but diifers in the way the address is calculated
 lw $t1,num2($zero)
 
 div $t4,$t0,$t1 # 3-reg method
 
 div $t3,$t0,10  # wecan use immediate values
 
 div $t0,$t1     #for higher digits we can use 2-reg
 mflo $s0  #quotient
 mfhi $s1  #remainder
 
 li $v0,1
 add $a0,$s0,$zero
 syscall
 
#ends the program
li $v0,10
syscall 
