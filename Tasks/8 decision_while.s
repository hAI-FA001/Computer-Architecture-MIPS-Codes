.data
save: .word 3,3,3,4

.text
main:
    # while (save[i] == k) i += 1

    addi $s3, $0, 3  # i
    addi $s5, $0, 3  # k
    la $s6, save  # address of save

    Loop: sll $t1, $s3, 2  # 4i
        add $t1, $t1, $s6  # save + 4i or save[i]
        lw $t0, 0($t1)  # load value
        bne $t0, $s5, Exit  # exit if i != k
        addi $s3, $s3, 1  # increment i
        j Loop
    
    Exit:
        li $v0, 10
        syscall
