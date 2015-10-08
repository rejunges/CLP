PROGRAM trabalho1 !Inicio do trabalho de clp em fortran
	IMPLICIT NONE !Todas as variáveis terão que ter seus tipos definidos IMPLICITAMENTE
	!Declaração de variáveis
	CHARACTER *10 first !Primeira linha-> equivalente a first[10]
	CHARACTER *1000 second !Segunda linha-> equivalente a second[1000]
	!Abertura de arquivo
	OPEN(UNIT=50,FILE="entrada.txt") !Leitura de arquivo, demais atributos não são obrigados (status, action)
	!leitura do arquivo
	READ(50, *) first  !Le a primeira linha do arquivo
	READ(50,*) second !Le a segunda liha do arquivo
	print *, first
	print *, second
	CLOSE(50) !Fecha o arquivo
	!Chama a subrotina, e passa os 2 parametros ( primeira linha e segunda linha )
	!CALL numVezesEstaContida(first, second) 
	
END PROGRAM trabalho1
