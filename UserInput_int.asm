.data
 prompt: .asciiz "Enter a number: "
 message: .asciiz "The entered number is "
 
.text

# Prompt the user to enter a number
li $v0, 4
la $a0, prompt
syscall

#Get the user's input
li $v0, 5 #entered value will be in $v0
syscall

#Store the result in $to
move $t0, $v0

# Display message
li $v0, 4
la $a0, message
syscall

# Print or show the number
li $v0, 1
move $a0,$t0
syscall
