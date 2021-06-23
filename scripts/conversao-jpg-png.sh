#!/bin/bash

cd ~/shell-script/imagens-livros

for imagen in *.jpg
do
	convert $imagem $imagem.png
done