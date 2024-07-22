.data
	stringa: .asciiz "anna" #stringa con terminatore (ultimo carattere ha valore 0)
.text
.globl main
main:

	la $a0,stringa
	jal palindroma
	#$v0 = 1, palindroma
	move $a0,$v0
	li $v0,1
	syscall
	
	
	li $v0,10
 	syscall
 
 
palindroma:
	#trova lunghezza stringa (in bytes)
	move $t0,$a0
	
	loop:
	lb $t1,0($t0)#carico carattere stringa
	beqz $t1,fineLoop
	addi $t0,$t0,1
	j loop
	
	
	fineLoop: #in $t0 ho l'indirizzo dell'ultimo carattere della stringa.
	
	#controllo palindromo
	move $t1,$a0
	#$t0, elemento a dx
	#$t1, elemento a sx
	
	#numero iterazioni per controllare palindromo = len/2(parte intera)
	subi $t0,$t0,1
	sub $t4,$t0,$t1
		
	loopDue:
	lb $t2,0($t0) #elemento a dx
	lb $t3,0($t1) #elemento a sx
	addi $t1,$t1,1
	addi $t0,$t0,-1
	
	beq $t2,$t3,condDue
	j endProc
	
	condDue:
	subi $t4,$t4,1
	bnez $t4,loopDue
	
	endProc:
	#se $t4 è arrivato alla fine, è palindroma.
	seq $v0,$t4,$zero
	
	jr $ra