.data
.text
    .globl main
main:
    li $a0, 10 # initialize n to 10
    jal fib # call fib(n)  
    # print the result
    move $a0, $v0     # move the result from v0 to a0 for printing
    li $v0, 1         # load system call code for print integer
    syscall 
    li $v0, 10   # exit program
    syscall

fib:
    addiu $sp, $sp, -12
    sw $ra, 0($sp)    # preserve the address
    sw $a0, 4($sp)    # just found out know need to preserve a0

    sw $s0, 8($sp)    

    # base cases
    beq $a0, $zero, fibZero
    beq $a0, 1, fibOne

    # recursive case
    addi $a0, $a0, -1 # fib(n-1)
    jal fib # recursive 
    move $s0, $v0
    addi $a0, $a0, -1 # fib(n-1-1) = fib(n-2)
    jal fib # recursive 
    add $v0, $s0, $v0 # fib(n-1) + fib(n-2)

   
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addiu $sp, $sp, 12  #readjust the stack back 
    jr $ra

fibZero:
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addiu $sp, $sp, 12 #readjust the stack back 
    li $v0, 0
    jr $ra

fibOne:
    
    lw $s0, 8($sp)
    lw $a0, 4($sp)
    lw $ra, 0($sp)
    addiu $sp, $sp, 12  #readjust the stack back 
    li $v0, 1
    jr $ra
