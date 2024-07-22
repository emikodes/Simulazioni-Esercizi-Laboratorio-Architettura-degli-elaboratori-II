#Si scriva il codice Assembly che effettui:
#A[12] = h + A[8];
#Si assuma che:
#• h sia una variabile memorizzata nel segmento dati;
#• A sia un array di 15 elementi memorizzato nel segmento dati;
#Si inizializzino h e A con valori a piacere utilizzando delle direttive per l’assembler
#nel segmento dati
.data
	h: .word 80
	A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
.text
	la $t0,A #carico indirizzo di A
	lw $t1,32($t0) #carico indirizzo di A[8]
	lw $t2,h  #carico valore di h (add richiede registri)
	add $t1,$t1,$t2
	sw $t1,48($t0) #salvo risultato in A[12]