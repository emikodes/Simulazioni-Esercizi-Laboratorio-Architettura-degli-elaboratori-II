.data

.text
.globl main
main:

	li $a0,4
	li $a1,6
	
	jal prodotto_s

	li $v0,10
	syscall



somma:
	add $v0,$a0,$a1
	jr $ra
	
prodotto_s:
	#calcola a*b come a+a+a (b volte)
	move $t0,$fp
	subi $fp,$sp,4
	
	sw $ra,0($fp)
	sw $sp,-4($fp)
	sw $t0,-8($fp)
	subi $sp,$fp,8
	
	move $s1,$a1
	move $a1,$a0
	li $s2,1
	
	loop:
	jal somma
	add $s0,$s0,$v0
	subi $s1,$s1,2
	bgt $s1,$s2,loop
	
	beqz $s1,end
	add $s0,$s0,$a0
	
	
	end:
	lw $ra,0($fp)
	lw $sp,-4($fp)
	lw $t0,-8($fp)
	
	move $fp,$t0
	move $v0,$s0
	
	jr $ra
	