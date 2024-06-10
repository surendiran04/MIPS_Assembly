.data
n:          .word 6                  # Number of elements in the array
numbers:    .word 3, 1, 4, 1, 5, 9   # Array of numbers

.text
main:
    la $t0, numbers       # Load base address of the numbers array into $t0
    lw $t1, n             # Load the number of elements (n) into $t1
    li $t2, -2147483648   # Initialize the largest number to the minimum possible integer value
    li $t3, -2147483648   # Initialize the second largest number to the minimum possible integer value
    li $t4, 0             # Initialize loop counter to 0

loop:
    beq $t4, $t1, end_loop    # If loop counter ($t4) == n ($t1), exit loop
    lw $t5, 0($t0)            # Load the current number into $t5

    # Check if the current number is greater than the largest number
    bgt $t5, $t2, update_largest

    # Check if the current number is greater than the second largest number but less than the largest number
    bgt $t5, $t3, update_second_largest

next:
    addi $t0, $t0, 4          # Move to the next number in the array (4 bytes forward)
    addi $t4, $t4, 1          # Increment loop counter
    j loop                    # Jump back to the start of the loop

update_largest:
    add $t3, $zero, $t2       # Update the second largest number to the current largest number
    add $t2, $zero, $t5       # Update the largest number to the current number
    j next                    # Jump to the next iteration

update_second_largest:
    add $t3, $zero, $t5       # Update the second largest number
    j next                    # Jump to the next iteration

end_loop:
    li $v0,1
    move $a0,$t3                #2nd
    syscall
    
    li $v0,1
    move $a0,$t2               #largest
    syscall
   
    li $v0, 10               
    syscall 
