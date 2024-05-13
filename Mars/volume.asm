.data
   input: .asciiz "\nEnter the type of input as \n1.radius,\n2.diameter,\n3.circumference,\n4.exit:\n"
   msg1:.asciiz "Enter the radius:"
   msg2:.asciiz "Enter the diameter:"
   msg3:.asciiz "Enter the circumference:"
   msg4:.asciiz "Exited!"
   volume:.asciiz "Volume of the sphere:"
   zeroFl: .float 0.0
   twoFl: .float 2.0
   circFl:.float 6.28
   vFl:.float 4.176
.text 




lwc1 $f1, zeroFl

while:
li $v0, 4
la $a0,input
syscall
li $v0,5
syscall
move $t0,$v0
beq $t0,1,radius
beq $t0,2,diameter
beq $t0,3,circumference
j after


radius:
li $v0, 4
la $a0,msg1
syscall
li $v0,6
syscall
lwc1 $f9, vFl
add.s $f2, $f0, $f1
mul.s $f3,$f2,$f2
mul.s $f4,$f3,$f2
mul.s $f5,$f4,$f9
li $v0, 4
la $a0,volume
syscall
li $v0, 2
add.s $f12, $f1, $f5
syscall
j while

diameter:
li $v0, 4
la $a0,msg2
syscall
li $v0,6
syscall
lwc1 $f10, twoFl
lwc1 $f9, vFl
div.s $f2,$f0,$f10
mul.s $f3,$f2,$f2
mul.s $f4,$f3,$f2
mul.s $f5,$f4,$f9
li $v0, 4
la $a0,volume
syscall
li $v0, 2
add.s $f12, $f1, $f5
syscall
j while

circumference:
li $v0, 4
la $a0,msg3
syscall
li $v0,6
syscall
lwc1 $f11, circFl
lwc1 $f9, vFl
div.s $f2,$f0, $f11
mul.s $f3,$f2,$f2
mul.s $f4,$f3,$f2
mul.s $f5,$f4,$f9
li $v0, 4
la $a0,volume
syscall
li $v0, 2
add.s $f12,$f1,$f5
syscall
j while


after:
	li $v0, 4
	la $a0,msg4
	syscall