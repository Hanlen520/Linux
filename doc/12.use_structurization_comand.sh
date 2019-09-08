#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第十二章 使用结构化命令--。有一类命令会根据条件使脚本跳 过某些命令，成为结构化命令

echo "================================================================================================================="
echo "12.1 使用if-then语句"
    if pwd ;then
        echo  "It worked"
    fi
    # 检测用户是否登陆过
    test_user=crisimple
    if grep ${test_user} /etc/passwd; then
        echo "hello" ${test_user}
        ls -a /home/${test_user}.b*
    fi

echo "================================================================================================================="
echo "12.2 if-then-else语句"
    t_user=Crisimple
    if grep ${t_user} /etc/passwd ;then
        echo "The bash files for user ${t_user} are: "
        ls -a /home/${t_user}/.b*
    else
        echo "The user ${t_user} dose not exits on this system"
        echo
    fi

echo "================================================================================================================="
echo "12.3 嵌套if"
    t_user_a=crisimple
    if grep ${t_user_a} /home/${t_user_a}; then
        echo "The user ${t_user_a} exits on this system."
    else
        echo "The user ${t_user_a} dose not on this system."
        if ls -d /c/User/${t_user_a}/
        then
            echo "However, ${t_user_a} has a directory."
        fi
    fi
    # ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    t_user_b=crisimple
    if grep ${t_user_b} /home/${t_user_b}; then
        echo "The user ${t_user_a} exits on this system."
    elif ls -d /home/${t_user_b}; then
        echo "The user ${t_user_b} dose not exit on this system."
        echo "And, ${t_user_b} has a directory."
    else
        echo "The user ${t_user_b} dose not exits on this system."
        echo "And, ${t_user_b} dose not have a directory"
    fi


echo "================================================================================================================="
echo "12.4 test命令：test命令提供了在if-then语句中测试不同条件的途径"
    echo -e "\t 12.4.1 数值比较"
        echo -e "\t\t -eq相等；-ge大于等于；-gt大于；-le小于等于；-lt小于；-ne不等于"

    echo -e "\t 12.4.2 字符串比较"
        echo -e "\t\t =相同；!=不相同；<小；>大（大于号和小于号必须转义，否则shell会把它们当作重定向符号，把字符串值当作文件名；
                                                大写字母被认为是小于小写字母的。但sort命令恰好相反）；
                      -n是否非0；-z是否为0"

    echo -e "\t 12.4.3 文件比较 "
        echo -e "\t\t   -d file是否存在并是一个目录；-e file是否存在；-f file是否存在并是一个文件； -r file是否存在并可读；
                        -s file是否存在并非空；      -w file是否存在并可写；  -x file是否存在并可执行；
                        -O file是否存在并属于当前用户；         -G file是否存在并且默认组与当前用户相同；
                        file1 -nt file2 检查file1是否比file2新；   file1 -ot file2 检查file1是否比file2旧"


echo "================================================================================================================="
echo "12.5 复合条件测试  && || "



echo "================================================================================================================="
echo "12.6 if-then 的高级特性"
    echo -e "\t\t 12.6.1 使用双括号--允许你在比较过程中(括号里面可以是任意的数学赋值或比较表达式) "
            echo -e "\t\t val++ 	 后增 "
            echo -e "\t\t val-- 	 后减 "
            echo -e "\t\t ++val 	 先增 "
            echo -e "\t\t --val 	 先减 "
            echo -e "\t\t ! 		 逻辑求反 "
            echo -e "\t\t ~ 		 位求反 "
            echo -e "\t\t ** 		 幂运算 "
            echo -e "\t\t <<         左位移  "
            echo -e "\t\t >>         右位移  "
            echo -e "\t\t &          位布尔和  "
            echo -e "\t\t |          位布尔或  "
            echo -e "\t\t &&         逻辑和  "
            echo -e "\t\t ||         逻辑或  "

    echo -e "\t\t 12.6.2 使用双方括号--[方括号里是标准字符串比较]"


echo "================================================================================================================="
echo -e "12.7 case 命令---为比较变量寻找特定的值，case命令会采用列表格式来检查单个变量的多个值"
    course=math
    case ${course} in
    english)
        echo "I like ${course}";;
    math)
        echo "I like ${course}";;
    *)
        echo "I like play";;
    esac

echo "==================================================九九乘法表======================================================"
for (( i = 1; i <= 9; i++))
do
    for (( j = i; j <= 9; j++))
    do
        echo "${i} * ${j}" = `expr ${i} \* ${j}`
    done
done

