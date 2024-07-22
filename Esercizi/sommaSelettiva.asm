.data
arr: .space 80 #20 elementi
msg: .asciiz "Inserire la dimensione dell'array(MAX:20)"
msgdue: .asciiz "Inserire elemento array"
msgtre: .asciiz "Somma elementi: "
.text
.globl main

main:
	li $v0,51
	la $a0,msg
	syscall
	
	move $t0,$a0
	move $s1,$a0
	li $t3,0
	
	la $s0,arr
	li $t2,4
	
	loop:

	li $v0,51
	la $a0,msgdue
	syscall
	
	mul $t1,$t3,$t2
	add $t1,$s0,$t1
		
	sw $a0,0($t1)
	
	addi $t3,$t3,1
	blt $t3,$t0,loop
	
	
	la $a0,arr
	move $a1,$s1 #numero di elementi
	li $a2,0 #k
	jal P

end:
	move $t0,$v0
	li $v0,56
	la $a0,msgtre
	move $a1,$t0
	syscall
	
	li $v0,10
	syscall
	

######PROCEDURE######
P:
	li $t2,4
	li $v0,0
	li $t3,0
	
	bnez $a1,loopdue
	addi $t3,$t3,1
	

	loopdue:


	mul $t1,$t3,$t2
	add $t1,$a0,$t1
		
	lw $t4,0($t1)
	
	add $v0,$v0,$t4
	
	
	addi $t3,$t3,2
	blt $t3,$a1,loopdue
	jr $ra
