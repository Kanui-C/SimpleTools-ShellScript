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
function ayumi(){


echo -e "${ROSA}           █████╗ ██╗   ██╗██╗   ██╗███╗   ███╗██╗${ROSA}"
echo -e "${RED}          ██╔══██╗╚██╗ ██╔╝██║   ██║████╗ ████║██║${RED}"
echo -e "${AMARELO}          ███████║ ╚████╔╝ ██║   ██║██╔████╔██║██║${AMARELO}"
echo -e "${BRANCO}          ██╔══██║  ╚██╔╝  ██║   ██║██║╚██╔╝██║██║${BRANCO}"
echo -e "${VERDE}          ██║  ██║   ██║   ╚██████╔╝██║ ╚═╝ ██║██║${VERDE}"
echo -e "${CIANO}          ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝${CIANO}"
}
if [[ "$#" != "1" ]]; then
        echo -e "${VERDE}Numero De Argumentos Incorreto!${VERDE}"
        echo -e "Use: $0 host.com.br"
        exit
fi
ayumi
for servidor in $(host -t ns $1 | cut -d " " -f 4);
do
host -l -a $1 $servidor
done
