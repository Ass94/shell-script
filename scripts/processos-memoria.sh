#!/bin/bash

if [ ! -d log ]
then
	mkdir log
fi

processos_memoria(){
#Lista e ordena os 11 primeiros processos que mais consomem memória (grep [0-9] apenas números).
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processos
do
	#Imprime o nome do processo com base no pid
	nome_processo=$(ps -p $pid -o comm=)
	echo -n $(date +%F,%H:%M%S,) >> log/$nome_processo.log
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log
done
}
processos_memoria 2>erros_log.txt
if [ $? -eq 0 ]
then 
	echo "Os arquivos foram salvos com sucesso!"
else 
	echo "Houve um problema ao salvar os arquivos"
fi