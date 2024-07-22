	.data
	.text
	.globl main
main:
#in t0 metto 3, in s0 1,2,3
	li $s0,1
	li $t0,3
	
	mult $s0,$t0 #1*3
	
	addi $sp,$sp-4
	mflo $s0 #sposto 3 in s0
	sw $s0,0($sp) #butto 3 nello stack
	
	li $s0,2
	li $t0,3
	
	mult $s0,$t0#2*3
	
	addi $sp,$sp-4
	mflo $s0# sposto 6 in s0
	sw $s0,0($sp)# butto 6 nello stack

	li $s0,3
	li $t0,3
	
	mult $s0,$t0#3*3
	mflo $s0#9 lo metto direttamente in s0
	
	#ora nello stack ho 3,6, 9 nel registro $s0
	
	lw $t0, 0($sp)
	addi $sp, $sp,4
	#in t0 ho 6
	add $s0, $s0,$t0 #9+6
	
	lw $t0, 0($sp)#in t0 ho 3
	addi $sp, $sp,4
	add $s0, $s0,$t0#15+3
	
	li $v0,1
	#stampa nuovo numero, memorizzato in $a0
	addi $a0,$s0,0 #sposto da s0 ad a0
	syscall
	