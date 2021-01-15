#!/usr/bin/env bash
RED='\033[01;31m'
VERDE='\033[01;32m'
CIANO='\033[01;36m'
BRANCO='\033[01;37m'
if [[ "$#" != "3" ]]; then
	echo -e "${VERDE}Numero De Argumentos Incorreto!${VERDE}"
	echo -e "Use: $0 DNS range range"
	echo -e "${BRANCO}Exemplo: $0 174.162.214 1 255${BRANCO}"
	exit
fi
echo -e "\n\n${CIANO}Code Owner:https://github.com/kanui-C${CIANO}\n"
for ip in $(seq $2 $3);do
	echo -e "${RED}" |  tr '\n' '\r'
	host -t ptr $1.$ip | grep -v "37-59-174" | cut -d " " -f 5
done
