.text
main:
    # if (i == j) h = i + j

    addi $s0, $0, 1  # i
    addi $s1, $0, 1  # j

    bne $s0, $s1, lbl1  # branch if i != j
    add $s3, $s0, $s1  # h = i + j

    lbl1:

    li $v0, 10
    syscall