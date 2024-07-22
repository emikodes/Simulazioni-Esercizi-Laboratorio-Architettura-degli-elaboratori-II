#Si scriva il codice Assembly che:
# carichi il valore 5 nel registro $s1;
# carichi il valore 7 nel registro $s2;
# carichi il valore della somma dei due nel registro $s0.
.text
	li $s1,5
	li $s2,7
	add $s0, $s1,$s2
	