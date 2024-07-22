#Si traduca in Assembly la seguente riga di codice:
#A = B+C-(D+E)
#assegnando alle variabili
#A, B, C, D, E
#i registri
#$s0, ..., $s4.
#Si assumano valori iniziali
#1, 2, 3, 4
#S0 = S1 + S2 -(S3-S4)
.text
	li $s0,1
	li $s1,2
	li $s2,3
	li $s3,4
	li $s4,5
	
	add $t0,$s1,$s2
	add $t1,$s3,$s4
	sub $s0, $t0,$t1