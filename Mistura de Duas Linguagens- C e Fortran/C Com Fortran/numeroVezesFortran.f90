FUNCTION numero(first,tam1,second,tam2) !Parametros passados
	CHARACTER *10, INTENT(IN) :: first !Não altera o valor de first
	CHARACTER *1000, INTENT (IN) :: second !Não altera o valor de second
	INTEGER :: cont, aux, inicio
	INTEGER, INTENT (IN):: tam1, tam2
		cont=0
		aux=1		
		inicio=1
	!Para não comparar inutilmente os ultimos chars da string2, descontamos o tamanho da string1		
	DO WHILE(aux <= (tam2 -tam1+1)) 
		!Compara por posições como se fossem posições de um vetor.
		IF(first(inicio: tam1) == second(aux:(tam1 + aux-1))) THEN
			cont=1+cont
		END IF
		aux = aux + 1
	END DO
	numero= cont
END FUNCTION numero
