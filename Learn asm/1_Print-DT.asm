.data
	num: 		.word 		1
	fl: 		.float 		3.14159
	krisdou:	.double 	1.234
	zerodou:	.double 	0.0
	ch:  		.asciiz 	"a"
	string: 	.asciiz 	"Krisna"
	newline: 	.asciiz 	"\n"
.text
#printing a integer
	li $v0, 1
	lw $a0, num 		#(will be stored in $a0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
#printing a float	
	li $v0, 2
	lwc1 $f12, fl		#(will be stored in $f12 like $a0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
#printing a double	(way1)	
	li $v0,3
	ldc1 $f12, krisdou 	#(will take 2 registers i.e here $f12 & $f13)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
 #printing a double	(way2)	
 	ldc1 $f0,zerodou	# $f0,$f1 = 0.0
 	ldc1 $f2,krisdou	# $f2,$f3 = 1.234
 	
 	add.d $f4,$f0,$f2	# $f4,$f5 = 1.234 + 0.0
 	
 	li $v0,3
 	syscall
 	
	li $v0, 4
	la $a0, newline
	syscall
#printing a chracter	
	li $v0, 4
	la $a0, ch		#(will be stored in $a0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
 #printing a string	
	li $v0, 4
	la $a0, string		#(wil be stored in $a0)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
