//biblioteca.c
#include <stdio.h>
#include <stdlib.h>

int numeroVezes(char *pont1,char *pont2){
	char *base1, *base2;
	int cont=0;
	base1 = pont1;
	base2 = pont2;
	while(*pont2 != '\n'){
		while(*pont1 == *pont2){
			pont1++;
			pont2++;
			if(*pont1 == '\n'){
				cont++; //achou a subpalavra
			}
		}
		base2++;
		pont1 = base1;
		pont2 = base2;
	}
	return cont;
}
