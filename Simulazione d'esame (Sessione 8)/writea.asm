.data
a: .word 10
s: .asciiz "Fine"
V: .word 1,1,1,1,1
.text
.globl main

main:

li $t0,0
li $t1,4

loop:

la $t3,V
mul $t6,$t0,$t1

add $t3,$t3,$t6
la $t5,a
lw $t4, ($t5)

add $t4,$t4,$t0

sw $t4,($t3)

addi $t0,$t0,1
ble $t0,$t1,loop

#in $t3 ho l'indirizzo di V
addi $t3,$t3,16 #penultimo elemento
#memorizzo in a
sw $t3,($t5)

li $v0,4
la $a0,s
syscall

li $v0,10
syscall