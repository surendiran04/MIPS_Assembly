.data
  msg1:.asciiz "Enter a float number:"
  msg2:.asciiz "the entered float number is:"
  zeroFl: .float 0.0
 .text 
li $v0, 4
la $a0,msg1
syscall

li $v0,6
syscall
lwc1 $f4, zeroFl

li $v0, 4
la $a0,msg2
syscall

li $v0,2
add.s $f12, $f0, $f4
syscall
