#include <stdio.h>
#include <string.h>
#include "biblioteca.h"

int main(void) {
	FILE *arquivo; // estrutura para usar arquivo
	int cont;
	char linha1[11], linha2[1001], *pont1, *pont2; // cria uma 'string' para a linha 1 e a linha 2
	arquivo = fopen("entrada.txt", "r+");// abre o programa para read-leitura
	if (arquivo == NULL){ // se o arquivo é NULL significa que ele não existe
		printf("Erro ao abrir o arquivo\n");
		return 0;//fecha o programa caso o arquivo seja NULO
	}
	pont1=fgets(linha1, 12, arquivo);  // esse fgets lê a primeira linha
	pont2=fgets(linha2, 1002, arquivo);  // esse fgets lê a segunda linha
	fclose(arquivo); //fecha o programa
	cont = numeroVezes(pont1, pont2); //Chama a função que verifica o número de vezes 
	printf ("%d", cont);
	while(getchar() != '\n');
	return 0;

}

