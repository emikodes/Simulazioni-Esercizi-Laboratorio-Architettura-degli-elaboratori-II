.data

.text

.globl main

main:
li $a0,5
jal fattoriale

li $v0,10
syscall

fattoriale:
move $t0,$fp
addiu $fp,$sp,-4
sw $t0,0($fp)
sw $sp,-4($fp)
sw $s0,-8($fp)
sw $ra,-12($fp)
addiu $sp,$fp,-20

bgtz $a0,recursive
li $v0,1
j end

recursive:
	move $s0,$a0
	subi $a0,$a0,1
	jal fattoriale
	mul $v0,$s0,$v0

end:
lw $t0,0($fp)
lw $sp,-4($fp)
lw $s0,-8($fp)
lw $ra,-12($fp)
move $fp,$t0
jr $ra

