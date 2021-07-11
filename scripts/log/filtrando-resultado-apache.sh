#!/bin/bash

cd /c/Softwares/2021/alura/shell-script/apache-logs

# \b -> Não será aceito caracteres adjacentes
# ([0-9]{1,3}\.) -> Apenas número de um a três algarismo separados por ponto.
# {3} -> irá se repetir três vezes.
# IP válido: 47.86.228.66
 #IP inválido: 47.86.228.6666

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then
        echo "O endereço IP procurado não está presente no arquivo"
    fi
else
    echo "Formato não é válido"
fi

