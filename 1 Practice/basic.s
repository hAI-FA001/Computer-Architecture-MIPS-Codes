main:
    addi $t0, $0, 1  # t0 = 1
    addi $t1, $0, 5  # t1 = 5
    sll $t1, $t1, 1  # t1 = 2*5

    sub $t2, $t0, $t1  # t2 = t0 - t1 = 1 - 10

    Exit:
        li $v0, 10
        syscall
