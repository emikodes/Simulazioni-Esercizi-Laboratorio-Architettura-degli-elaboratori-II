.data
uguali: .asciiz "tutti e tre uguali"
diversi: .asciiz "tutti e tre diversi"
.text
.globl main

main:
	li $a0,3
	li $a1,2
	li $a2,4
	
	la $a3, jumpEqual
	
	la $t0,jumpNotEqual	
	addi $sp,$sp,4
	sw $t0,0($sp)
	
	jal branch3equal
	j end

jumpEqual:
	li $v0,55
	la $a0, uguali
	syscall
	j end

jumpNotEqual:
	li $v0,55
	la $a0, diversi
	syscall
		
end:
	li $v0,10
	syscall
	
#######PROCEDURE########			
	
branch3equal:
	#input: $a0,$a1,$a2 sono 3 interi
	#	$a3 e un elemento dello stack, sono due indirizzi del segmento testo.
	#$a3 -> jumpEqual
	#stack -> jumpNotEqual
	
	#retrieve from stack
	lw $t2, 0($sp)
	subi $sp,$sp,4
	
	sub $t0,$a0,$a1
	sub $t1,$a0,$a2
	
	beq $t0,$t1,saltouguali
	bne $t0,$t1,saltononuguali
	
	saltouguali:
		jr  $a3
	saltononuguali:
		beq $a0,$a1,endproc
		beq $a0,$a2,endproc
		jr $t2
	endproc:
	jr $ra