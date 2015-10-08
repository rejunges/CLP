PROGRAM trabalho1 !Inicio do trabalho de clp em fortran
	IMPLICIT NONE !Todas as variáveis terão que ter seus tipos definidos IMPLICITAMENTE
	
	CHARACTER (LEN = 10 ) :: first !Primeira linha
	CHARACTER (LEN = 1000) :: second !Segunda linha
	OPEN(UNIT=50,FILE="entrada.txt") !Leitura de arquivo, demais atributos não são obrigados (status, action)
	READ(50, *) first  !Le a primeira linha do arquivo
	READ(50,*) second !Le a segunda liha do arquivo
	print *, first
	CLOSE(50) !Fecha o arquivo
END PROGRAM trabalho1
