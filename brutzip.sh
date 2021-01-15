#!/usr/bin/env bash
#Criador: Kanui Matoi
#Data: 4 de nov 17:40
#Versao: 0.1
#Instagram: www.instagram.com/cybers3cur1ty/
#Discord: K4NU1#0105
#My First Program in Shell scripting
#Function: Crack zip
wordlist="$2"
zip="$1"
ROSA='\033[01;35m'
BRANCO='\033[01;37m'
VERDE='\033[01;32m'
function banner(){

	echo -e "         █████╗ ██╗   ██╗██╗   ██╗███╗   ███╗██╗    ███████╗██╗██████╗ "
	echo -e "	██╔══██╗╚██╗ ██╔╝██║   ██║████╗ ████║██║    ╚══███╔╝██║██╔══██╗"
	echo -e "	███████║ ╚████╔╝ ██║   ██║██╔████╔██║██║      ███╔╝ ██║██████╔╝"
	echo -e "	██╔══██║  ╚██╔╝  ██║   ██║██║╚██╔╝██║██║     ███╔╝  ██║██╔═══╝ "
	echo -e "	██║  ██║   ██║   ╚██████╔╝██║ ╚═╝ ██║██║    ███████╗██║██║     "
	echo -e "	╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝    ╚══════╝╚═╝╚═╝     "
	echo -e "Code Owner:https://github.com/kanui-C"
		                                                               

}
if [[ "$#" != "2" ]]; then
	banner
	echo -e "${VERDE}Numero de argumentos invalido!${VERDE}"
	echo -e "${BRANCO}Use: $0 arquivo.zip wordlist.txt${BRANCO}"
	exit 1

elif [[ ! -f "$wordlist" ]]; then
	banner
	echo -e "${VERDE}$wordlist nao encontrada!${VERDE}"
	echo -e "${BRANCO}Use: $0 arquivo.zip wordlist.txt${BRANCO}"
        exit 1

fi
banner
for SENHAS in $(cat $wordlist); do
	cmd=$(7z t $zip -p$SENHAS 2>&1 | grep "password")
        echo -e "${VERDE}Testando: $SENHAS                               ${VERDE}" | tr '\n' '\r'
	if [[ "$cmd" == "" ]]; then
		sleep 1
                echo -e "\n${ROSA}Senha: $SENHAS${ROSA}"
                exit 0;
        fi
done
