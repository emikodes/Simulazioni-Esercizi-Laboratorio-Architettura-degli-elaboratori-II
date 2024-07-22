.data
	msg: .asciiz "Inserisci V"
	msgdue: .asciiz "Inserisci N"
	breakmsg: .asciiz "break"
	msgtre: .asciiz "Sum: "
.text
.globl main
main:
	li $v0,51
	la $a0, msg
	syscall
	#$a0 contiene V
	
	move $s1,$a0
	move $s4,$a0
		
	li $v0,51
	la $a0, msgdue
	syscall
	#$a0 contiene N
	move $s0,$a0


	li $s3,1

	
	loop:
		mul $s2,$s3,$s3
		div $s2,$s1
		mfhi $t0
		beqz $t0, pausa
		add $s4,$s4,$s2
		addi  $s3,$s3,1
		bne $s3,$s1,loop
		beq $s3,$s1,end
	
	pausa:
	#stampa break
	li $v0,55
	la $a0, breakmsg
	syscall
	 
	end:
	#stampa sum
	li $v0,56
	la $a0,msgtre
	move $a1,$s4
	syscall
	li $v0,10
	syscall
