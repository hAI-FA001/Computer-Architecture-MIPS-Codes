.data
A: .word 1,2,3,4,5,6,7,8,9,10

.text
# .global main

main:
    # g = h + A[8]
    
    addi $s2, $0, 2  # s2 = h
    la $s3, A  # s3 = A

    lw $t0, 32($s3)  # A[8] -> 32 + A
    add $s1, $s2, $t0


    li $v0, 10
    syscall