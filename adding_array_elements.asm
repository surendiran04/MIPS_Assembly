.data
n:          .word 5                    # Number of elements in the array
numbers:    .word 1, 2, 3, 4, 5        # Sequence of numbers to add

.text
main:
    la $t0, numbers        # Load base address of the numbers array into $t0
    lw $t1, n              # Load the value of n into $t1
    li $t2, 0              # Initialize sum to 0 in $t2
    li $t3, 0              # Initialize loop counter to 0 in $t3

loop:
    beq $t3, $t1, end_loop # If loop counter ($t3) == n ($t1), exit loop
    lw $t4, 0($t0)         # Load the current number into $t4
    add $t2, $t2, $t4      # Add the current number to sum ($t2)
    addi $t0, $t0, 4       # Move to the next number in the array (4 bytes forward)
    addi $t3, $t3, 1       # Increment loop counter
    j loop                 # Jump back to the start of the loop

end_loop:
    li $v0,1
    move $a0,$t2
    syscall

    li $v0, 10           
    syscall               
