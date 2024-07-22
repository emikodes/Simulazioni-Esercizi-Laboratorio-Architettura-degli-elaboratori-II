.data
A: .word 12,5,10,31,9
N: 5
.text

.globl main

main:

la $t2,N
lw $t1,0($t2)
move $t2,$zero
la $s0,A
li $t3,999

ciclo:
lw $a0,0($s0) #x
li $a1,2 #b
jal min_potenza
bgt $v0,$t3,avanti
move $t3,$v0
move $t4,$a0
avanti:
addi $s0,$s0,4
addi $t2,$t2,1
blt $t2,$t1,ciclo

move $a0,$t4
li $v0,1
syscall

li $v0,10
syscall

min_potenza:
	move $t0,$a1
	bge $a1,$a0,fine
	
	loop:
	mul $a1,$a1,$t0
	blt $a1,$a0,loop

	fine:
	sub $v0,$a1,$a0
	move $v1,$a1
	jr $ra
	
	