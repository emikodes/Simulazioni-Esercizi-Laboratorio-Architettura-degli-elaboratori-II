.data
.text
.globl main

main:
    li $a0, 12
    jal fibonacci

    li $v0, 10
    syscall

fattoriale:
    move $t2, $fp
    addiu $fp, $sp, -16

    sw $t2, 0($fp)
    sw $sp, -4($fp)
    sw $ra, -8($fp)
    sw $a0,-12($fp)

    li $t0, 1
    bgt $a0, $t0, ELSE
        move $v0, $t0
        j end

ELSE:
    addiu $a0, $a0, -1
    jal fattoriale
    lw $a0, -12($fp)

    mul $v0, $a0, $v0

end:
    lw $t2, 0($fp)
    lw $sp, -4($fp)
    lw $ra, -8($fp)

    move $fp, $t2

    jr $ra


fibonacci:
    move $t2, $fp
    addiu $fp, $sp, -16

    sw $t2, 0($fp)
    sw $sp, -4($fp)
    sw $ra, -8($fp)
    sw $a0,-12($fp)


    addiu $sp, $fp, -16

    li $t0,1
    li $t1,2

    beq $a0,$t0,uno
    beq $a0,$t1,due

    addiu $a0,$a0,-2
    jal fibonacci
    lw $a0,-12($fp)
    sw $v0,-16($fp)

    addiu $a0,$a0,-1
    jal fibonacci

    lw $t3,-16($fp)
    add $v0,$v0,$t3

    j endFib


    due:
    move $v0,$t0
    j endFib

    uno:
    move $v0,$zero



    endFib:
    lw $t2, 0($fp)
    lw $sp, -4($fp)
    lw $ra, -8($fp)
    lw $a0,-12($fp)
    move $fp, $t2

    jr $ra
