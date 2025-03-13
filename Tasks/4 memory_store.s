.data
A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13

.text
main:
    # A[12] = h + A[8]

    addi $s2, $0, 5  # h
    la $s3, A  # s3 = A

    lw $t0, 32($s3)  # load A[8]
    add $t0, $s2, $t0  # add
    sw $t0, 48($s3)  # store to A[12]

    li $v0, 10
    syscall