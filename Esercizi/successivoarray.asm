	.data
	messaggioIntroduttivo: .asciiz "Inserisci un valore intero: "
	.align 2 #allineo alla word, 2 alla 2 bytes, 4 bytes, una word.
	vettore: .space 8 #8 bytes, 64 bit, 2 word (una per ogni intero)
	.text
	.globl main
main:
	la $s0,vettore
	
	li $v0,4
	la $a0,messaggioIntroduttivo
	syscall
	#stampa messaggio introduttivo
	
	li $v0,5
	syscall
	#numero letto in $v0
	
	add $a0,$v0,1
	sw $v0,0($s0)
	sw $a0,4($s0)
	
	li $v0,1
	lw $a0, 0($s0)
	syscall
	
	lw $a0,4($s0)
	syscall
