#!/bin/bash
limpar="\r\033[K"
ROSA='\033[01;35m'
RED='\033[01;31m'
AMARELO='\033[01;33m'
BRANCO='\033[01;37m'
VERDE='\033[01;32m'
NEGRITO='\033[1m'
CIANO='\033[01;36m'
PRETO='\033[01;30m'
function norton(){


echo -e "${ROSA}           █████╗ ██╗   ██╗██╗   ██╗███╗   ███╗██╗${ROSA}"
echo -e "${RED}          ██╔══██╗╚██╗ ██╔╝██║   ██║████╗ ████║██║${RED}"
echo -e "${AMARELO}          ███████║ ╚████╔╝ ██║   ██║██╔████╔██║██║${AMARELO}"
echo -e "${BRANCO}          ██╔══██║  ╚██╔╝  ██║   ██║██║╚██╔╝██║██║${BRANCO}"
echo -e "${VERDE}          ██║  ██║   ██║   ╚██████╔╝██║ ╚═╝ ██║██║${VERDE}"
echo -e "${CIANO}          ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝${CIANO}"
}
if [[ "$#" != "2" ]]; then
	echo -e "${VERDE}Numero De Argumentos Incorreto!${VERDE}"
	echo -e "Use: $0 host.com.br wordlist.txt"
	exit
elif [[ ! -f "$2" ]]; then
	echo -e "${VERDE}Arquivo de wordlist '$2' não encontrado.${VERDE}"
	exit
fi
host="$1"
wordlist="$2"
norton
for linhas in $(cat $wordlist); do
    echo -e "${BRANCO}Testando: $linhas.$1                              ${BRANCO} " | tr '\n' '\r'
    echo -e "${RED}" |  tr '\n' '\r'
    host -t cname $linhas.$host | grep "alias for"

done
