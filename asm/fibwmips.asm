# Add
# Sub
# And
# Or
# Slt
# Jump 
# Beq
# Addi
# Lw 
# And
# Or
# Sw

.data
.text
    .globl main
main:
    addi $1, $0, 5 # initialize n
    j fib # call fib(n)  
    # print the result
    add $a0, $v0, $zero     # move the result from v0 to a0 for printing

fib:   

    # base cases
    beq $1, $0, fibZero
    beq $1, 1, fibOne

    # recursive case
    addi $1, $1, -1 # fib(n-1)
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
