main:
    # a = b + c + d - e
    addi $s1, $0, 1  # b
    addi $s2, $0, 2  # c
    addi $s3, $0, 4  # d
    addi $s4, $0, 3  # e

    add $t0, $s1, $s2
    add $t0, $t0, $s3
    sub $s0, $t0, $s4

    li $v0, 10
    syscall
