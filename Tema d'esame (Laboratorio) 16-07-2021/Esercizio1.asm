.data
	arr: .word 12,45,2,8,5,6,7,8
	L: .word 8
	N: .word 18
.text

.globl main

main:
	la $a2,arr#$a2 -> base address
	
	la $t0,L
	lw $a1,0($t0) #$a1 -> L
	
	la $t0,N
	lw $a0,0($t0) #$a0 -> N
	
	jal copian
	
	#end
	li $v0,10
	syscall
	
copian:
	#in $a0 ho N
	li $t0,4
	move $t1,$a0
	mul $a0,$a0,$t0 #numero bytes
	
	li $v0,9
	syscall
	
	move $v1,$v0
	
	blt $t1,$a1,loop
	move $t1,$a1
	
	#in $v0 ho il base address dell'area allocata nello heap.
	loop:
	
	lw $t0,0($a2)
	sw $t0,0($v1)
	
	addi $a2,$a2,4
	addi $v1,$v1,4
	
	subi $t1,$t1,1
	bnez $t1,loop
	
	jr $ra
	
	