#include <stdio.h>
#include <string.h>
//o número de vezes que a primeira string é encontrada na segunda

int main(void) {
	FILE *arquivo; // estrutura para usar arquivo
	int cont=0;
	char linha1[11], linha2[1001], *pont1, *pont2, *base1, *base2; // cria uma 'string' para a linha 1 e a linha 2
	arquivo = fopen("entrada.txt", "r");// abre o programa para read-leitura
	if (arquivo == NULL){ // se o arquivo é NULL significa que ele não existe
		printf("Erro ao abrir o arquivo\n");
		return 0;//fecha o programa caso o arquivo seja NULO
	}
	pont1=fgets(linha1, 12, arquivo);  // esse fgets lê a primeira linha
	pont2=fgets(linha2, 1002, arquivo);  // esse fgets lê a segunda linha
	fclose(arquivo); //fecha o programa
	//printf("Linha 1: %s\n", linha1);
	//printf("Linha 2: %s\n", linha2);
	base1 = pont1;
	base2 = pont2;
	while(*pont2 != '\n'){
		//printf("Ta pegando no ponteiro 1: %c\n", *pont1);
		//printf("Ta pegando no ponteiro 2: %c\n", *pont2);
		while(*pont1 == *pont2){
			//printf("Ta pegando no ponteiro 1: %c\n", *pont1);
			//printf("Ta pegando no ponteiro 2: %c\n", *pont2);
			pont1++;
			pont2++;
			if(*pont1 == '\n'){
				cont++; //achou a subpalavra
				//printf("ACHOOOOU\n");
			}
		}
		base2++;
		pont1 = base1;
		pont2 = base2;
	}
	printf ("%d", cont);
	return 0;

}
