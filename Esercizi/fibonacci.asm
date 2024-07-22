.text
.globl main

main:
	li $a0,2
	jal fibonacci
	
	li $v0,10
	syscall
	
fibonacci:
move $t0,$fp
addiu $fp,$sp,-4

sw $t0,0($fp)
sw $sp,-4($fp)
sw $ra,-8($fp)
sw $s0,-12($fp)
sw $a0,-16($fp)
addiu $sp,$fp,-20

bgt $a0,1,recursive
li $v0,1
j end

recursive:
	subi $a0,$a0,1
	jal fibonacci
	move $s0,$v0
	subi $a0,$a0,1
	jal fibonacci
	add $s0,$s0,$v0
	j end
	

end:

lw $t0,0($fp)
lw $sp,-4($fp)
lw $ra,-8($fp)
lw $s0,-12($fp)
lw $a0,-16($fp)
move $fp,$t0
jr $ra