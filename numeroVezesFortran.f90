SUBROUTINE numeroVezesFortran(first,second,cont) !Parametros passados
			IMPLICIT NONE
			CHARACTER *10, INTENT(IN) :: first !Não altera o valor de first
			CHARACTER *1000, INTENT (IN) :: second !Não altera o valor de second
			INTEGER , INTENT(INOUT) :: cont	 !Altera o valor de cont no decorrer da função e essa mudança é passada pro main
			INTEGER aux, inicio 
			cont=0
			aux=1		
			inicio=1
			!Para não comparar inutilmente os ultimos chars da string2, descontamos o tamanho da string1		
			DO WHILE(aux <= LEN_TRIM(second)-LEN_TRIM(first)+1) 
				!Compara por posições como se fossem posições de um vetor.
				IF(first(inicio:LEN_TRIM(first)) == second(aux:LEN_TRIM(first) + aux - 1)) THEN
					 cont=1+cont
				END IF
				aux = aux + 1
			END DO
END SUBROUTINE numeroVezesFortran
