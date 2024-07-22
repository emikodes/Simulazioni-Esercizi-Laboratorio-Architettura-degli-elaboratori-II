.data
.globl stack
stack: .word 0 #NULL POINTER
msg: .asciiz "valore:"
emptyStack: .asciiz "Stack vuoto"
.text
.globl main

main:
	li $a1,2
	li $a2,1
	li $a3,30
	jal push #aggiungi elemento alla pila
	
	li $a1,4
	li $a2,8
	li $a3,12
	jal push #aggiungi elemento alla pila
	
	li $a1,3
	li $a2,5
	li $a3,10
	jal push #aggiungi elemento alla pila
	
	jal pop
	
	#in $v0 ho A, $v1 ho Y, nello stack ho X
	move $a1,$v0
	li $v0,56
	la $a0,msg
	syscall
	
	move $a1,$v1
	li $v0,56
	la $a0,msg
	syscall
	
	lw $a1,0($sp)
	addi $sp,$sp,4
	li $v0,56
	la $a0,msg
	syscall
	
	jal pop
	
	#in $v0 ho A, $v1 ho Y, nello stack ho X
	move $a1,$v0
	li $v0,56
	la $a0,msg
	syscall
	
	move $a1,$v1
	li $v0,56
	la $a0,msg
	syscall
	
	lw $a1,0($sp)
	addi $sp,$sp,4
	li $v0,56
	la $a0,msg
	syscall
	
	jal pop
	
	#in $v0 ho A, $v1 ho Y, nello stack ho X
	move $a1,$v0
	li $v0,56
	la $a0,msg
	syscall
	
	move $a1,$v1
	li $v0,56
	la $a0,msg
	syscall
	
	lw $a1,0($sp)
	addi $sp,$sp,4
	li $v0,56
	la $a0,msg
	syscall
	
	jal pop
	jal pop
	
	
end:
	li $v0,10
	syscall
	
#PROCEDURES	
	
push: #$a1- X, $a2 Y, $a3- A
	li $v0,9 #chiamata Segment Break
	la $a0,16 #alloco 16 bytes, (4 Int da memorizzare, 4Xsizeof(int) = 4x4)
	syscall
	
	#in $v0 ho il base address dell'area di memoria allocata
	la $t0,stack
	lw $t1,0($t0)#indirizzo top pila
	sw $t1,0($v0) #memorizzo stack pointer
	
	sw $a3,4($v0) #memorizzo A
	sw $a2,8($v0) #memorizzo Y
	sw $a1,12($v0) #memorizzo X
	
	#$v0 vale base-address+16 ora
	addi $v0,$v0,16
	#riporto il valore di $v0 a "sopra" la pila appena creata
	
	sw $v0,0($t0) #aggiorno stack pointer
	
	jr $ra
	

pop:
	la $t0,stack
	lw $t1,0($t0)#indirizzo top pila
	beqz $t1,stackVuoto
	subi $t1,$t1,16
	
	#leggo ultimo elemento
	lw $t2,0($t1) #indirizzo penultimo elemento
	sw $t2,0($t0) #aggiorno valore puntatore stack
	
	lw $v0,4($t1) #memorizzo A
	lw $v1,8($t1) #memorizzo Y
	lw $t3,12($t1) #memorizzo X, metto nello stack
	
	subi $sp,$sp,4
	sw $t3,0($sp)
	j endProc
	
	stackVuoto:
	li $v0,55
	la $a0,emptyStack
	li $a1,0
	syscall
	
	endProc:
	jr $ra
		