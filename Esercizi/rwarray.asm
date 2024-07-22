.data
 arr: .word 2,3,4,5,6,7,8,9,10,11,12,13,14,15
 msg: .asciiz "Inserisci A"
 msgdue: .asciiz "Inserisci B"
 msgtre: .asciiz "Inserisci C"
 notrecognizedmsg: .asciiz "comando non riconosciuto"
  
.text
.globl main
	main:
	la $s6,arr
	li $t2,4
	
	li $v0,51
	la $a0, msg
	syscall
	move $s0,$a0
	#$s0 contiene A
	
	li $v0,51
	la $a0, msgdue
	syscall
	move $s1,$a0
	#$s1 contiene B

	li $v0,51
	la $a0, msgtre
	syscall
	move $s2,$a0
	#$s2 contiene C
	
	beqz $s2,czero
	beq $s2,1,cuno
	beq $s2,-1,cmenouno
	j caltro
	
	
	czero:
		#scambia a-esimo elemento con b-esimo
		mul $s0,$s0,$t2 #indice*4
		add $t3,$s6,$s0
		lw $t0,0($t3) #$t0 contiene a-esimo elem
		
		mul $s1,$s1,$t2 #indice*4
		add $t4,$s6,$s1
		
		lw $t1,0($t4) #$t1 contiene b-esimo elem
		
		sw $t0, 0($t4)
		sw $t1, 0($t3)
		#scambio elementi
		j end
	cuno:
		#sovrascriva il b-esimo elemento dell’array con il valore dell’a-esimo elemento;
		mul $s0,$s0,$t2 #indice*4
		add $t3,$s6,$s0
		lw $t0,0($t3) #$t0 contiene a-esimo elem
		
		mul $s1,$s1,$t2 #indice*4
		add $t4,$s6,$s1
		
		sw $t0, 0($t4) #b-esimo elem. = a-esimo elem.
		j end
	cmenouno:
		#sovrascriva l’a-esimo elemento dell’array con il valore del b-esimo elemento;
		mul $s1,$s1,$t2 #indice*4
		add $t3,$s6,$s1
		lw $t0,0($t3) #$t0 contiene b-esimo elem
		
		mul $s2,$s0,$t2 #indice*4
		add $t4,$s6,$s2
		sw $t0, 0($t4) #a-esimo elem. = b-esimo elem.
		j end
	caltro:
		li $v0,55
		la $a0, notrecognizedmsg
		syscall



	end:
	li $v0,10
	syscall
