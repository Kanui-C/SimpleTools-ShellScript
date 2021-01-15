#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void imprime();
int main(int argc, char *argv[]){
	char emails[128];
	//Responsavel por abrir o arquivo para leitura = r
	FILE *arq;

	//Responsavel por abrir o arquivo para leitura e escrita. os dados vao para o final do arquivo = a+
	FILE *savearq;
	arq = fopen(argv[2], "r");
	savearq = fopen(argv[3], "a+");
	//Verifica se o script recebeu mais de 3 argumentos
	if(argc < 4){
		fprintf(stderr, "Use: %s [DOMINIO] [LEAK] [NOME]", argv[0]);
		printf("\nExemplos: %s @gmail.com vazamento.txt gmail.txt\n", argv[0]);
		printf("          %s @hotmail.com vazamento.txt hotmail.txt\n", argv[0]);
		return 1;
	}
	//Caso o script nao consiga abrir o arquivo ele returna null e finaliza o script

	if(arq == NULL){
		fprintf(stderr, "Use: %s [DOMINIO] [LEAK] [NOME]", argv[0]);
		printf("\nExemplos: %s @gmail.com vazamento.txt gmailorgazinado.txt\n", argv[0]);
		printf("          %s @hotmail.com vazamento.txt hotmailorganizado.txt\n", argv[0]);
		return 1;
	}
	imprime();
	//Lendo todas as linhas do arquivo e salvando na variavel email
	while(fscanf(arq, "%s", emails) != EOF){
		//Verificando se a varaivel email é igual ao argumento 1 (dominio)
		if(strstr(emails, argv[1]) != NULL){
			//se sim ele vai salvar no argumento 3 (nome do arq);
			fprintf(savearq, "%s\n",emails);

		}

	}
	//Processo terminado
	printf("\nProcesso Terminado!\n");

	//Fechando arquivos
	fclose(arq);
	fclose(savearq);
	//Return 0; << Significa que o script foi executado com sucesso
	//Nem um erro foi encontrado no processo!
	return 0;
}


void imprime(){
	printf("  █████╗ ██╗   ██╗██╗   ██╗███╗   ███╗██╗    ███╗   ███╗ █████╗ ██╗██╗     \n");
	printf(" ██╔══██╗╚██╗ ██╔╝██║   ██║████╗ ████║██║    ████╗ ████║██╔══██╗██║██║     \n");
	printf(" ███████║ ╚████╔╝ ██║   ██║██╔████╔██║██║    ██╔████╔██║███████║██║██║     \n");
	printf(" ██╔══██║  ╚██╔╝  ██║   ██║██║╚██╔╝██║██║    ██║╚██╔╝██║██╔══██║██║██║     \n");
	printf(" ██║  ██║   ██║   ╚██████╔╝██║ ╚═╝ ██║██║    ██║ ╚═╝ ██║██║  ██║██║███████╗\n");
	printf(" ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚══════╝\n");
	printf("Code Owner:https://github.com/kanui-C                                      \n");
}