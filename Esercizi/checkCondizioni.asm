.data

	a: .byte 0
	.align 2
	b: .byte 0
	.align 2
	c: .byte 0
	.align 2
	err: .asciiz  "errore"
.text
.globl main
main:
	la $t0,a
	la $t1,b
	la $t2,c
	
	# cambia qui i valori da memorizzare
	li $t3,10#a
	li $t4,7#b
	li $t5,10#c
	
	
	sw $t3,0($t0)
	sw $t4,0($t1)
	sw $t5,0($t2)
	
	sge $t6,$t3,$t4
	sne  $t7,$t5,$zero
	
	beqz  $t6,non_verificata
	beqz $t7,non_verificata
	
	verificata:
	add $t3, $t3, $t4
	mult $t5,$t3
	mflo $a0
	li $v0,1
	syscall
	j end
	
	#print errore
	non_verificata:
	li $v0,4
	la $a0,err
	syscall
	
	end:
	li $v0, 10
	syscall