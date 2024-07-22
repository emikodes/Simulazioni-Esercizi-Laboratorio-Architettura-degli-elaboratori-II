.data 
	msg: .asciiz "Inserisci un valore numerico intero"
	msgdue: .asciiz "Il numero pari successivo è: "
.text
.globl main
main:
	li $v0,51
	la $a0, msg
	syscall 
	
	#$a0 contains read value
	move $a1,$a0
	li $t0,2
	div $a1,$t0
	mfhi  $t0
	
	bnez $t0, dispari
	
	addi $a1,$a1,1 #se pari aggiungi 1, poi verrà aggiunto ancora 1
	
	dispari:
	addi $a1,$a1,1
	
	li $v0,56
	la $a0,msgdue
	syscall
	