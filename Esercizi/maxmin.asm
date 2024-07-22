.data
arr: .word 3,2,14,4,5,4,3,7,8
n: .word 8 #n elem -1
maxmsg: .asciiz "Elemento maggiore: "
minmsg: .asciiz "Elemento minore: "
.text
.globl main

	main:
	la $a0, arr
	la $t0,n
	lw $a1, 0($t0)
	
	jal max
	
	move $a1,$v0
	li $v0,56
	la $a0,maxmsg
	syscall
	
	la $a0, arr
	la $t0,n
	lw $a1, 0($t0)
	jal min

	move $a1,$v0
	li $v0,56
	la $a0,minmsg
	syscall
	
	end:
	li $v0,10
	syscall
	
	
	
	
	
	#procedura max
	
	max:
	#in $a0 c'è base address di arr, in $a1 c'è N-1
	li $t3,4
	
	loop:
	
	mul $t0,$a1,$t3
	add $t2,$a0,$t0
	
	lw $t1,0($t2)
	
	ble $t1,$t4,avanti
	##swap new max
	move $t4,$t1
	
	avanti:
	subi $a1,$a1,1
	bnez $a1,loop
	
	move $v0,$t4
	
	jr $ra
	
	
	
	
	#procedura min
	
	min:
	#in $a0 c'è base address di arr, in $a1 c'è N-1
	li $t3,4
	li $t4,1000
	
	loopdue:
	
	mul $t0,$a1,$t3
	add $t2,$a0,$t0
	
	lw $t1,0($t2)
	
	bge $t1,$t4,avantidue
	move $t4,$t1
	
	avantidue:
	subi $a1,$a1,1
	bnez $a1,loopdue
	
	move $v0,$t4	
	
	jr $ra
