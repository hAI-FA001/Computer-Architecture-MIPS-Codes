main:
    # f = (g + h) - (i + j)

    addi $s1, $0, 1  # g
    addi $s2, $0, 1  # h
    addi $s3, $0, 3  # i
    addi $s4, $0, 2  # j

    add $t0, $s1, $s2  # g + h
    add $t1, $s3, $s4  # i + j
    sub $s0, $t0, $t1  # final

    li $v0, 10
    syscall
