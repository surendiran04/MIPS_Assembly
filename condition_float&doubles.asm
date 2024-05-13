.data
	msg: .asciiz "Same value"
	msg1: .asciiz "Different values"
	float1: .float 5.5
	float2: .float 5.5
.text
main:
        lwc1 $f2,float1
        lwc1 $f3,float2
	add.s  $f0,$f0,$f2
	add.s $f1,$f1,$f3
	
	c.eq.s $f1,$f0   #if else for float and doubles (c.le.s,c.lt.s also we can use .d for double)
	bc1t print       #branch print if c1 is true  (same we can use bc1f - false)
	li $v0,4 
	la $a0,msg1
	syscall
	
	b exit	
	
exit:		
	li $v0,10
	syscall
						
					
print:
	li $v0,4
	la $a0,msg
	syscall
	
	b exit


