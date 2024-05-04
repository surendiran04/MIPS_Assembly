.data
  newline: .asciiz "\n" 
  float: .float 20.345533     #it can store only 6 decimal digits
  double: .double 5.240324443
  int: .word 5
  
  .text
  #To print a float
  li $v0,2
  lwc1 $f12,float
  syscall 
  
  #To print a new line or string
  li $v0,4
  la $a0,newline
  syscall
  
  #To print a double
  li $v0,3
  ldc1 $f12,double
  syscall  
  
  li $v0,4
  la $a0,newline
  syscall
  
  #To print a integer
  li $v0,1
  lw $a0,int
  syscall
 
 
