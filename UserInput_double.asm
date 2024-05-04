.data
 prompt: .asciiz "Enter a double number: "
 message: .asciiz "The entered duble is "
 zerofl: .double 0.0

.text
# Prompt the user to enter 
li $v0, 4
la $a0, prompt
syscall

#Get the user's input
li $v0,7   #the entering value will be in $f0
syscall

#putting the value of 0.0 in $f2
ldc1 $f2,zerofl     #use only double registers(even numbered f registers)

# Display message
li $v0, 4
la $a0, message
syscall

# Print or show the double
li $v0, 3
add.d $f12,$f0,$f2     #without having 0.0 in $f2 can also work similarly
syscall
