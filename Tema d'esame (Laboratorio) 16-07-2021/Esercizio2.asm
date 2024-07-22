.data
	primoArr: .word 1,2,4,3
	secondoArr: .word 3,1,2,3	
	len: .word 4
.text

.globl main
main:
	la $a0,primoArr
	la $a1,secondoArr
	la $t0,len
	lw $a2,0($t0)
	
	jal numero_vittorie

	li $v0,10
	syscall
	
	
lancio_singolo:
	
	sne $v0,$a0,$a1
	sgt $v0,$a0,$a1
	
	sub $t0,$a0,$a1
	bgez $t0,endProc
	addi $v0,$zero,2

	endProc:
	jr $ra
	
numero_vittorie:
	#$a0,primoArr
	#$a1,secondoArr
	#$a2,len
	
	move $t2,$fp
	move $fp,$sp
	subi $sp,$sp,12

	sw $sp,-4($fp)
	sw $ra,-8($fp)
	sw $t2,-12($fp)
	
	move $s0,$a0
	move $s1,$a1
	move $s3,$zero #contatore iterazioni
	move $s4,$zero #contatore vittorie 1
	move $s5,$zero #contatore vittorie 2
	li $s6,1
	li $s7,2
	
	loop:
	
	lw $a0,0($s0)
	lw $a1,0($s1)
	
	jal lancio_singolo
	
	beq $v0,$s6,vittoriauno
	beq $v0,$s7,vittoriadue
	beq $v0,$zero,avanti
	
	vittoriauno:
	addi $s4,$s4,1
	j avanti
	
	vittoriadue:
	addi $s5,$s5,1
	j avanti
	
	
	avanti:
	addi $s0,$s0,4
	addi $s1,$s1,4
	addi $s3,$s3,1
	blt $s3,$a2,loop
	
	lw $sp,-4($fp)
	lw $ra,-8($fp)
	lw $fp,-12($fp)
	
	
	move $v0,$s4
	move $v1,$s5
	
	jr $ra
	
	
