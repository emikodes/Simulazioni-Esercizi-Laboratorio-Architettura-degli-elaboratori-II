.data
	arrayUno: .word 1,8,5,9,5
	arrayDue: .word 5,4,11,8,100
	N: .word 5
.text

.globl main

main:
	la $a0,arrayUno
	la $a1,arrayDue
	
	la $t0,N
	lw $a2,0($t0)
	jal conta_multipli
	
	move $a0,$v0
	li $v0,1
	syscall
	
	li $v0,10
	syscall

multiplo:
	div $a0,$a1
	mfhi $t0
	div $a1,$a0
	mfhi $t1
	
	#if t0 or t1 is 0 (reminder or division)
	move $v0,$zero
	
	seq $v0,$t0,$zero #set $v0 to 1
	bgtz $v0,endProc
	seq $v0,$t1,$zero
	endProc:
	jr $ra


conta_multipli:
	#$a0 -> base address di arrayUno
	#$a1 -> base address di arrayDue
	#$a2 -> N
	
	move $t0,$a0
	move $t1,$a1
	move $t2,$a2
	move $t3,$zero

	loop:
	
	lw $a0,0($t0)
	lw $a1,0($t1)
	
	
	move $t4,$fp
	move $fp,$sp
	
	sw $t0,-4($fp)
	sw $t1,-8($fp)
	sw $t2,-12($fp)
	sw $t3,-16($fp)
	sw $sp,-20($fp)
	sw $ra,-24($fp)
	sw $t4,-28($fp)
	
	subi $sp,$sp,28
	
	
	jal multiplo
	
	lw $t0,-4($fp)
	lw $t1,-8($fp)
	lw $t2,-12($fp)
	lw $t3,-16($fp)
	lw $sp,-20($fp)
	lw $ra,-24($fp)
	lw $fp,-28($fp)
	
	
	add $t3,$t3,$v0
	addi $t0,$t0,4
	addi $t1,$t1,4
	
	subi $t2,$t2,1
	bnez $t2,loop
	
	move $v0,$t3
	jr $ra