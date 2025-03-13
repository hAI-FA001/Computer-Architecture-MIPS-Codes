.text
main:
    # if (i == j)
    #     f = g + h
    # else
    #     f = g - h

    addi $s1, $0, 3  # g
    addi $s2, $0, 4  # h
    addi $s3, $0, 2  # i
    addi $s4, $0, 1  # j

    bne $s3, $s4, Else  # branch if i != j
    add $s0, $s1, $s2  # f = g + h
    j Exit
    Else: sub $s0, $s1, $s2  # f = g - h

    Exit:
    li $v0, 10
    syscall