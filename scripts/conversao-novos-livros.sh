#!/bin/bash

converte_imagem(){
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}

varrer_diretorio(){

	# paramêtro da funcao.
	cd $1

	# * fará a varredura em todos os arquivos

	for arquivo in *
	do
		local caminho_arquivo=$(find /c/Softwares/2021/alura/shell-script/imagens-novos-livros -name $arquivo)
		if [ -d $caminho_arquivo ]
		then
			#Recursao. Chamando a funcao dentro dela mesma.
			varrer_diretorio $caminho_arquivo
		else 
			converte_imagem $caminho_arquivo
		fi
	done
}
varrer_diretorio /c/Softwares/2021/alura/shell-script/imagens-novos-livros 2> erros.txt

if [ $? -eq 0 ]
then
	echo "Arquivos convertidos com sucesso!"
else 
	echo "Erro na conversão dos arquivos!"
fi