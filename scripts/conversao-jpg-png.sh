#!/bin/bash

converte_imagem(){
cd /c/Softwares/2021/alura/shell-script/imagens-livros

if [ ! -d png ]
then
    mkdir png
fi

for imagem in *.jpg
do
	#loca: transforma em variável local. Só pode ser acessada dentro da funcao.
    local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}
#invocando a funcao. Caso haja erro (2) direcionar log para um arquivo
converte_imagem 2>erros_conversao.txt
#verificando status da saída da funcao. 0 sucesso. diferente de zero ocorreu erro.
#$? verifica o status da saída da funcao.
if [ $? -eq 0 ] 
then	
	echo "Conversão realizada com sucesso!"
else 
	echo "Houve uma falha no processo!"
fi