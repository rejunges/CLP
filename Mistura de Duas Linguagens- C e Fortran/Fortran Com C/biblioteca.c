//biblioteca.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int numero(char *linha1,int *tam1,char *linha2, int *tam2){
	int cont=0,i=0,j=0, n=0;
	char aux[*tam1]; // string auxiliar para fazer comparações
	//Como o código vem do fortran precisamos colocar um \0 no fim para se adaptar ao código C
	linha1[*tam1]='\0';
	linha2[*tam2]='\0';
	i=0;
	while (j != *tam2){
		n++;
		while (i!=*tam1){
			aux[i]=linha2[j];
			j++;
			i++;
		}
		aux[i]='\0';
		j=n; //para garantir que encontrará substrings que serão sobrescritas
		i=0;
		if (strcmp(linha1, aux)==0){ //strings iguais, achou 1 substring
			cont++; //achou a subpalavra
		}
	}
	return cont;
}
