PROGRAM trabalho1 !Inicio do trabalho de clp em fortran

IMPLICIT NONE !Todas as variáveis terão que ter seus tipos definidos EXPLICITAMENTE
CHARACTER *10 first !Primeira linha-> equivalente a first[10]
CHARACTER *1000 second !Segunda linha-> equivalente a second[1000]
INTEGER cont,tam1,tam2
INTEGER, EXTERNAL :: numero !Função q retorna o numero de substrings encontradas

!Abertura de arquivo
OPEN(UNIT=50,FILE="entrada.txt") !Leitura de arquivo, demais atributos não são obrigados (status, action)

!leitura do arquivo
READ(50, *) first  !Le a primeira linha do arquivo
READ(50,*) second !Le a segunda liha do arquivo
CLOSE(50) !Fecha o arquivo
tam1=LEN_TRIM (first)
tam2=LEN_TRIM (second)
cont =numero(first,tam1, second, tam2)
print *, cont !Informa o numero de vezes que a string1 está na string2
END PROGRAM trabalho1

