#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//o número de vezes que a primeira string é encontrada na segunda
extern int numero(char *linha1, int *tam1, char *linha2, int *tam2);
	
int main(void) {
	FILE *arquivo; // estrutura para usar arquivo
	int cont,i, tam1, tam2;
	char linha1[11], linha2[1001], ch ; // cria uma 'string' para a linha 1 e a linha 2
	arquivo = fopen("entrada.txt", "r+");// abre o programa para read-leitura
	if (arquivo == NULL){ // se o arquivo é NULL significa que ele não existe
		printf("Erro ao abrir o arquivo\n");
		return 0;//fecha o programa caso o arquivo seja NULO
	}
	i=0;
	// Le a primeira string, char a char até a quebra de linha
	while( (ch=fgetc(arquivo))!= '\n' ){ 
		linha1[i]=ch;
		i++;
	}
	linha1[i]='\0';//encerra a primeira string
	i=0;
	// Le a segunda string, char a char 
	while( (ch=fgetc(arquivo))!= '\n' ){
		linha2[i]=ch;
		i++;
	}
	linha2[i]='\0';//encerra a segunda string
	fclose(arquivo); //fecha o programa*/
	
	tam1=strlen(linha1);
	tam2=strlen(linha2);
	cont = numero(linha1, &tam1, linha2, &tam2); //Chama a função que verifica o número de vezes 
	printf ("%d", cont);
	return 0;

}
