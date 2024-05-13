.data
  msg1:.asciiz "Enter a float number:\n"
  msg2:.asciiz "the addition two float number is:"
  zeroFl: .float 0.0
 .text 
li $v0, 4
la $a0,msg1
syscall

li $v0,6
syscall
lwc1 $f4, zeroFl
add.s $f6, $f0, $f4

li $v0,6
syscall
lwc1 $f5, zeroFl
add.s $f7, $f0, $f5

li $v0, 4
la $a0,msg2
syscall

li $v0,2
add.s $f12, $f6, $f7
syscall
