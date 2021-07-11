#!/bin/bash

cd /c/Softwares/2021/alura/shell-script/apache-logs

if [ $1 == "GET" ]
then 
    cat apache.log | grep $1
elif [ $1 == "POST" ]
then
    cat apache.log | grep $1
elif [ $1 == "PUT" ]
then
    cat apache.log | grep $1
elif [ $1 == "DELETE" ]
then
    cat apache.log | grep $1
fi