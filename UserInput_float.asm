.data
 prompt: .asciiz "Enter a floating number: "
 message: .asciiz "The entered float is "
 zerofl: .float 0.0
.text
# Prompt the user to enter 
li $v0, 4
la $a0, prompt
syscall

#Get the user's input
li $v0,6   #the entered value will be in $f0
syscall

#putting the value of 0.0 in $f1
lwc1 $f1,zerofl

# Display message
li $v0, 4
la $a0, message
syscall

# Print or show the float
li $v0, 2
add.s $f12,$f0,$f1
syscall
