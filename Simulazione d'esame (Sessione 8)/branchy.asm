.data
msg: .asciiz "\nSono T1"
msgdue: .asciiz "\nSono T2"
msgPrev: .asciiz "Prima dell'esecuzione della procedura"
.text
.globl main

main:

#due valori interi A e B.
li $a0,20
li $a1,20
#due indirizzi del segmento testo T1 e T2.
la $a2,T1
la $a3,T2

jal branchy
jr $v0



T1:
li $v0,4
la $a0,msg
syscall
j end

T2:
li $v0,4
la $a0,msgdue
syscall
j end

end:
	li $v0,10
	syscall


branchy:
	sub $t0,$a0,$a1
	beqz $t0,returnPrev
	bgtz $t0,returnT1
	bltz $t0,returnT2
	
	returnT1:
		move $v0,$a2
		j endProcedure
	
	returnT2:
		move $v0,$a3
		j endProcedure
	
	returnPrev:
		move $v0,$ra
		subi $v0,$v0,8
	
	endProcedure:
		jr $ra
	
	
