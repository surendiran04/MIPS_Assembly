name: datatype value 
• msg: .asciiz “Hello \n”
• letter: .byte ‘a’
• number: .word 97
• real: .float 2.2
• real: .double 3.512
• inStr: .space 2

 
 li $v0, ____     <br>
 1 - print integer   <br>
 2 -  print float   <br>
 3 - print double  <br>
 4 - print string /character <br>
 5 - get integer   <br>
 6 - get float    <br>
 7 - get double    <br>
 8 - get string  


b target_label similiar to j target_label (both will not return to the main fn where it get called)

beq $register, $register, target_label
beq - branches to the target_label if the values stored in the two registers are equal
bne – branch if the two registers are not equal.
blt – branch if the first register is less than the second register.
ble – branch if the first register is less than or equal to the second register.
bgt – branch if the first register is greater than the second register.
bge – branch if the first register is greater than or equal to the second register.
