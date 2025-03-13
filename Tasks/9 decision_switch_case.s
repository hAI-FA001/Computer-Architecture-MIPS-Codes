.text
main:
    # switch(k) {
    #     case 0: f = i + j; break;
    #     case 1: f = g + h; break;
    #     case 2: f = g - h; break;
    #     case 3: f = i - j; break;
    # }

    # simplify into if-else:
    # if (k == 0) f = i + j;
    # else if (k == 1) f = g + h;
    # else if (k == 2) f = g - h;
    # else if (k == 3) f = i - j;

    addi $s1, $0, 4  # g
    addi $s2, $0, 3  # h
    addi $s3, $0, 8  # i
    addi $s4, $0, 1  # j
    addi $s5, $0, 3  # k
    
    # make constants
    addi $t0, $0, 0
    addi $t1, $0, 1
    addi $t2, $0, 2
    addi $t3, $0, 3

    beq $s5, $t0, L1  # k == 0
    beq $s5, $t1, L2  # k == 1
    beq $s5, $t2, L3  # k == 2
    beq $s5, $t3, L4  # k == 3
    j Exit

    L1: add $s0, $s3, $s4  # f = i + j
    j Exit
    L2: add $s0, $s1, $s2  # f = g + h
    j Exit
    L3: sub $s0, $s1, $s2  # f = g - h
    j Exit
    L4: sub $s0, $s3, $s4  # f = i - j
    j Exit  # not needed, but keeping it for symmetry
    
    Exit:
        li $v0, 10
        syscall
