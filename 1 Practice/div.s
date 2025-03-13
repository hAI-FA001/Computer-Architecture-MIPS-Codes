main:
    # 9 / 3: 1001 / 0011 = 0011
    # 9 - 3 -> 6 - 3 -> 3 - 3 => 3 iters (quotient)

    addi $s0, $0, 11  # divide this, will have remainder at the end
    addi $s1, $0, 3  # by this
    add $s2, $0, $0  # counter, will have quotient at the end

    divide: blt $s0, $s1, done  # dividend < divisor, then stop
        sub $s0, $s0, $s1  # s0 = s0 - s1 -> e.g. new value = 11 - 3
        addi $s2, $s2, 1  # increment
        j divide

    done:

    Exit:
        li $v0, 10
        syscall
