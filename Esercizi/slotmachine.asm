	.data
	msg: .asciiz "Inserisci un numero intero: "
	msgdue: .asciiz "Numero dopo scommessa: "
	.text
	.globl main
main:
	li $v0,51
	la $a0,msg
	syscall
	#in $a0 ho l'int letto
	addi $a1,$a0,0 #sposto a0 in a1, max per rand gen
	
	li $t0,-1
	mult $a0,$t0 #-num
	
	mflo $a0 #min per random generator
	
	li $v0,42
	syscall
	#in a0 ho num random
	
	add $a1,$a1,$a0
	#sommo input + numero random
	
	li $v0,56
	la $a0,msgdue
	syscall
	
	

	