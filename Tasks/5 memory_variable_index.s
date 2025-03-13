.data
A: .word 1,2,3,4,5,6,7,8,9,10

.text
main:
    # g = h + A[i]

    addi $s2, $0, 3  # h
    la $s3, A  # A
    addi $s4, $0, 5  # i

    add $t1, $s4, $s4  # 2i
    add $t1, $t1, $t1  # 4i
    add $t1, $t1, $s3  # A + 4i or A[i]
    lw $t0, 0($t1)  # get A[i] from memory
    add $s1, $s2, $t0  # final result

    li $v0, 10
    syscall
