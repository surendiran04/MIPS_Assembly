name: datatype value 
• msg: .asciiz “Hello \n”
• letter: .byte ‘a’
• number: .word 97
• real: .float 2.2
• real: .double 3.512
• inStr: .space 2
 
 li $v0, ____
 1 - print integer
 2 -  print float
 3 - print double
 4 - print string / character
 5 - get integer
 6 - get float
 7 - get double
 8 - get string


b target_label similiar to j target_label (both will not return to the main fn where it get called)

beq $register, $register, target_label
beq - branches to the target_label if the values stored in the two registers are equal
bne – branch if the two registers are not equal.
blt – branch if the first register is less than the second register.
ble – branch if the first register is less than or equal to the second register.
bgt – branch if the first register is greater than the second register.
bge – branch if the first register is greater than or equal to the second register.
