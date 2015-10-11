//biblioteca.c
#include <stdio.h>
#include <stdlib.h>

int numeroVezesC(char *linha1,char *linha2, int tam1, int tam2){
	int cont=0,i=0,j=0, n=0;
	char aux[tam1]; // string auxiliar para fazer comparações
	
	while (j != tam2){
		n++;
		while (i!=tam1){
			aux[i]=linha2[j];
			j++;
			i++;
		}
		j=n; //para garantir que encontrará substrings que serão sobrescritas
		i=0;
		if (strcmp(linha1, aux)==0){ //strings iguais, achou 1 substring
			cont++; //achou a subpalavra
		}
	}
	return cont;
}
