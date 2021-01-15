#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <stdlib.h>
#include <unistd.h>


char ROSA[]="\033[01;35m";
char RED[]="\033[01;31m";
char BRANCO[]="\033[01;37m";
char CIANO[]="\033[01;36m";



int main(int argc, char *argv[]){
	int mysocket;
	int conexao;
	struct sockaddr_in alvo;
	int PORTA = 0;
	char *IP = argv[1];
	if(argc > 2 || argc <= 1){
		printf("%sUse: %s {IP}\nExemplo:%s 192.168.0.1\n",ROSA,argv[0],argv[0]);
		return(1);
	}
	printf("%s[!]Ayumi Scan Port\n",CIANO);
	printf("%s--------------------------\n",BRANCO);
	for(int i = 0;i<65535;i++){
		mysocket = socket(AF_INET,SOCK_STREAM,0);
		alvo.sin_family = AF_INET;
		alvo.sin_port = htons(PORTA);
		alvo.sin_addr.s_addr = inet_addr(IP);
		PORTA++;
	

	conexao = connect(mysocket, (struct sockaddr *)&alvo, sizeof alvo);
	if(conexao == 0){

		printf("%s{+}%s [%d] Porta Aberta!%s {+}\n",BRANCO,RED,PORTA,BRANCO);
		close(mysocket);
		close(conexao);
	}
	else
		close(mysocket);
	}
	printf("%s--------------------------\n",BRANCO);
		
return 0;
}