#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: calculate(+ - * /)

function operate(){

    if [ ${2} == "+" ]; then
        addResult=$(awk -v x=${1} -v y=${3} 'BEGIN {printf x + y}')
        echo "The addResult is: ${1}${2}${3}=${addResult}"
    fi

    if [ ${2} == "-" ];then
        lessResult=$(awk -v x=${1} -v y=${3} 'BEGIN {printf x - y}')
        echo "The addResult is: ${1}${2}${3}=${lessResult}"
    fi

    if [ ${2} == "x" ];then
        multResult=$(awk -v x=${1} -v y=${3} 'BEGIN {printf x * y}')
        echo "The addResult is: ${1}${2}${3}=${multResult}"
    fi


    if [ ${2} == "/" ];then
        divResult=$(awk -v x=${1} -v y=${3} 'BEGIN {printf x / y}')
        echo "The addResult is: ${1}${2}${3}=${divResult}"
    fi

}

read -t 50 -p "Input first number: " first
read -t 50 -p "Input your operator(+ - * /): " operator
read -t 50 -p "Input second number: " second

operate ${first} ${operator} ${second}