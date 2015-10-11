#include <stdio.h>
#include <string.h>

void numeroVezesFortran_(char *linha1, char *linha2, int *cont);

int main(void) {
	FILE *arquivo; // estrutura para usar arquivo
	int cont, tam_linha1, tam_linha2;
	char linha1[11], linha2[1001], *pont1, *pont2; // cria uma 'string' para a linha 1 e a linha 2
	arquivo = fopen("entrada.txt", "r+");// abre o programa para read-leitura
	if (arquivo == NULL){ // se o arquivo é NULL significa que ele não existe
		printf("Erro ao abrir o arquivo\n");
		return 0;//fecha o programa caso o arquivo seja NULO
	}
	pont1=fgets(linha1, 12, arquivo);  // esse fgets lê a primeira linha
	pont2=fgets(linha2, 1002, arquivo);  // esse fgets lê a segunda linha
	fclose(arquivo); //fecha o programa
	numeroVezesFortran_(linha1, linha2, &cont);
	printf("%d", cont);
	return 0;
}
