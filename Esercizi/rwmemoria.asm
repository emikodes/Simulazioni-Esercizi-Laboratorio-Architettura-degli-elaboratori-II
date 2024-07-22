#Si scriva il codice Assembly che effettui:
#A[99] = 5 + B[i] + C
#Si assuma che:
#• A e B siano vettori di 100 elementi, ogni elemento è un intero a 32 bit;
#• C e i siano variabili intere a 32 bit.
#Si inizializzino unicamente questi dati:
#i=3, C=2, B[i]=10.
.data
	i: .word 3
	C: .word 2
	A: .space 400
	B: .space 400
.text
	la $t0, B #carico ind. B[0]
	lw $t3, i #carico ind. i
	
	lw $t7,4
	mult  $t3,$t7 #i*4
	mflo $t7
	add $t0,$t0,$t7 #B+i*4
	li $t0,10 #B[i]=10
	#$t0 ha indirizzo di B[i]
	
	la $t1,A
	add $t1,$t1,396 #99*4

	li $t4,5
	
	la $t5,C
	add $t4,$t4,$t5
	lw $t6, $t0
	add $t4,$t4,$t6