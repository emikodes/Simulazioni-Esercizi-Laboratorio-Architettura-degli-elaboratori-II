	.data
intro: .asciiz "Inserisci un valore intero: "
	.text
	.globl main

main:
	li $v0,4 #load immediate
	la $a0,intro
	syscall
	#stampo messaggio introduttivo
	
	li $v0,5
	syscall
	#read integer, in $V0 ho il valore letto
	
	add $a0,$v0,1
	
	li $v0,1
	syscall
	#stampa nuovo numero, memorizzato in $a0
