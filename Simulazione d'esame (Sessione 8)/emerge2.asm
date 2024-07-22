.data
array: .word 1,2,3,4,5,6,7
k: .word 7
.text
.globl main

main:
	#due interi: i,j
	li $a0,3 #i
	li $a1,5 #j
	la $a2,array #base address dell'array
	
	la $t0,k
	lw $a3,0($t0) #numero di elementi dell'array
	jal emerge2

end:
	li $v0,10
	syscall
	
	
emerge2:
	li $v0,0
	bltz $a0,endProc
	bge $a0,$a3,endProc 
	#if i <0 or >k
	
	bltz $a1,endProc
	bge $a1,$a3,endProc 
	#if j <0 or >k
	
	li $t0,4
	mul $t1,$a0,$t0 #offset per elemento in posizione i
	add $t1,$a2,$t1 #in t1 ho l'indirizzo dell'i-esimo elemento
	lw $t2,0($t1) #in t2 ho l'i-esimo elemento
	
	
	mul $t3,$a1,$t0 #offset per elemento in posizione j
	add $t3,$a2,$t3 #in t3 ho l'indirizzo del j-esimo elemento
	
	lw $t4,0($t3) #in t4 ho il j-esimo elemento
	
	#if i==j
	beq $a0,$a1,loopDue
	
	#shift per i
	loop:
	lw $t0,-4($t1) #in t0 ho l'elemento prima della pos attuale
	sw $t0,0($t1) 
	subi $t1,$t1,4
	bne $t1,$a2,loop
	
	
	#shift per j
	loopDue:
	lw $t0,-4($t3) #in t0 ho l'elemento prima della pos attuale
	sw $t0,0($t3) 
	subi $t3,$t3,4
	bne $t3,$a2,loopDue
	
	
	#memorizzo elemento i ed elemento j in pos 0 e 1
	sw $t2,0($a2)
	beq $a0,$a1,endProc #se i e j sono uguali, non devo scrivere anche in pos 1
	sw $t4,4($a2)
	
	li $v0,1
	
	endProc:
	jr $ra