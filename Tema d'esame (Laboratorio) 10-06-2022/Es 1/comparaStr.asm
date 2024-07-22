.data
	PWD: .asciiz "Ciao\n"
	input: .space 101
.text

.globl main

main:
	li $v0,8
	la $a0,input
	li $a1,100
	syscall
	
	la $a1,PWD
	jal comparaStr
	
	li $v0,10
	syscall
	

comparaStr:
	loop:
	lb $t0,0($a0)
	lb $t1,0($a1)
	addi $a0,$a0,1
	addi $a1,$a1,1
	
	beq $t0,$t1,passo
	bne $t0,$t1,fineNo
	passo:
	beqz $t0,uguali
	bnez $t0,loop
	
	uguali:
	li $v0,1
	j fine
	
	fineNo:
	li $v0,0
	
	fine:
	jr $ra
	