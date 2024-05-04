.data
 num1: .word 100
 num2: .word 2
 newline: .asciiz "\n"
 
.text
   main:
 lw $t0,num1   #both the methods gives the same output but diifers in the way the address is calculated
 lw $t1,num2($zero)
 
 mul $t3,$t1,$t0
 
 mult $t1,$t0  #for higher digits we can use mult
 mflo $s0
 
 sll $s1,$t1,2   #left shift by the value - it is type of multiplication
 
 li $v0,1
 add $a0,$s1,$zero
 syscall
 
#ends the program
li $v0,10
syscall 
