#Si implementi il codice Assembly che effettui la moltiplicazione e la divisione tra
#i numeri 100 e 45, utilizzando le istruzioni dell’ISA e le pseudoistruzioni.

.text
	li $t0,100
	li $t1,45
	
	mul $s0,$t0,$t1
	div $s1,$t0,$t1
	
	