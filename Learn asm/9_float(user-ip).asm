# move doesn't work in float
.data 
	prompt: .asciiz	"Enter the float:"
	zeroFloat: .float 0.0
.text
	li $v0,4
	la $a0,prompt
	syscall
	
	lwc1 $f1,zeroFloat	# $f1 = 0.0
	
	li $v0,6		# $f0 = our float input will be stored
	syscall
	
	li $v0,2
	add.s $f12,$f0,$f1	# $f12 = $f0 + 0.0
	syscall 
