.data
 prompt: .asciiz "Enter a string: "
 message: .asciiz "The entered string is "
 input: .space 20 #20 characters
 
.text
   main:
# Prompt the user to enter 
li $v0, 4
la $a0, prompt
syscall

#Get the user's input
li $v0,8
la $a0,input
li $a1,20
syscall

# Display message
li $v0, 4
la $a0, message
syscall

# Print or show the string
li $v0, 4
la $a0,input
syscall

#ends the program
li $v0,10
syscall 
