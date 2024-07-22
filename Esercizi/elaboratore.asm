.data
	msg: .asciiz "Inserisci A;"
	msgdue: .asciiz "Inserisci B:"
	msgtre: .asciiz "Inserisci il codice dell'operazione: 0 - somma, 1 - differenza, 2 - moltiplicazione, 3 - divisione"
	ris: .asciiz "Il risultato è:"
.text
.globl main

main:
	li $v0,51
	la $a0, msg
	syscall
	move $t0,$a0#a
	
	la $a0, msgdue
	syscall
	move $t1,$a0#b
	
	la $a0, msgtre
	syscall
	
	move $a2,$a0 #operazione	
	move $a0,$t0 #a
	move $a1,$t1 #b

	
	jal elaboratore
	
	move $a1,$v0
	li $v0,56
	la $a0,ris
	syscall
end:
	li $v0,10
	syscall
	
	
	
# procedura elaboratore:

elaboratore:
	addi $t0,$zero,1
	addi $t1,$zero,2
	addi $t2,$zero,3
	
	beqz $a2,somma
	beq $a2,$t0,differenza
	beq $a2,$t1,moltiplicazione
	beq $a2,$t2,divisione
	
	somma:
	add $v0,$a0,$a1
	j fine
	differenza:
	sub $v0,$a0,$a1
	j fine
	
	moltiplicazione:
	mul $v0,$a0,$a1
	j fine

	divisione:
	div $a0,$a1
	mflo $v0
	mfhi $v1	
	
fine:
jr $ra