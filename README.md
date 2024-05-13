MIPS stands for Microprocessor without Interlocked Pipelined Stages <br/>
<h3>Different Data Types:</h3> <br>
name: datatype value <br>
• msg: .asciiz “Hello \n” <br>
• letter: .byte ‘a’  <br>
• number: .word 97  <br>
• real: .float 2.2   <br>
• real: .double 3.512  <br>
• inStr: .space 2   <br>

 <h3>Instruction:</h3> <br>
 li $v0, ____     <br>
 1 - print integer   <br>
 2 -  print float   <br>
 3 - print double  <br>
 4 - print string /character <br>
 5 - get integer   <br>
 6 - get float    <br>
 7 - get double    <br>
 8 - get string   <br>

 <h6>Load instructions</h6>
• la - string /character <br>
• lw - integer  <br>
• lwc1 - float  <br>
• ldc1 - double  <br>

For string and integer the value that needed to be printed should be in $a0 register <br>
For float and doubles the values that needed to be printed should be in $f12

<h3>Branch Instruction:</h3> <br>
b target_label similiar to j target_label (both will not return to the main fn where it get called)

beq $register, $register, target_label  <br>
beq - branches to the target_label if the values stored in the two registers are equal  <br>
bne – branch if the two registers are not equal. <br>
blt – branch if the first register is less than the second register. <br>
ble – branch if the first register is less than or equal to the second register. <br>
bgt – branch if the first register is greater than the second register.  <br>
bge – branch if the first register is greater than or equal to the second register. <br>
begz – branch if the register is equal to the zero(begz $reg,target_label). <br>
