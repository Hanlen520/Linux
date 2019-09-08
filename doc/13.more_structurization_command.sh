#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第十三章 更多的结构化命令

echo "================================================================================================================="
echo "13.1 for命令"
    echo -e "\t 13.1.1 读取列表中的值"
        for company in Alibaba Baidu Tencent Xiaomi Jingdong
        do
            echo The next state is ${company}
        done

    echo -e "\t 13.1.2 读取列表中的复杂值"
        for goto in Nevade "New York" "New Mexico"
        do
            echo Now I will go to ${goto}
        done

    echo -e "\t 13.1.3 从变量读取列表 "
        list="Alibaba Baidu Tencent Xiaomi Jingdong"
        list=${list}"Huawei"
        for state in ${list}
        do
            echo How are ever visted ${state}?
        done

    echo -e "\t 13.1.4 从命令读取值--用命令替换来执行任何能产生 输出的命令，然后在for命令中使用该命令的输出"
        echo "Alibaba Baidu Tencent" >> states
        file="states"  # states提前写好的一个文件
        for state in $(cat ${file})
        do
            echo "Visit beautiful $state"
        done
        # rm states

    echo -e "\t 13.1.5 更改字段分隔符[环境变量IFS，叫作内部字段分隔符(空格、制表符、换行符)]"
        # 指定多个IFS字符，只要将它们在赋值行串起来就行。 IFS=$'\n':;"
        file="states"
        IFS=$'\n'
        for state in $(cat ${file})
        do
            echo "Visit beautiful ${state}"
        done
        rm states

    echo -e "\t 13.1.6 用通配符读取目录"
        for file in /home/Crisimple/test/*
        do
            if [ -d "$file" ];then
                echo "$file is a directory"
            elif [ -f "$file" ];then
                echo "$file is a file"
            fi
        done



echo "================================================================================================================="
echo "13.2 C语言风格的for命令"
    echo -e "\t 13.2.1 C语言的for命令"
        #    for (i =0; i < 10; i++){
        #        printf("The next number is %d\n", i);
        #   }
        for (( i=1; i <= 10; i++ ))
        do
            echo "The next number is $i"
        done

    echo -e "\t 13.2.2 使用多个变量 "
        for (( a=1, b=10; a <= 10; a++, b-- ))
        do
            echo "$a - $b"
        done


echo "================================================================================================================="
echo "13.3 while 命令--在test命令返回非零退出状态码时，while命令会停止执行那组命令."
    echo -e "\t 13.3.1 while 的基本格式--用方括号来检查循环命令中用到的shell变量的值"
        var_while=10
        while [ ${var_while} -gt 0 ]
        do
            echo ${var_while}
            var_while=$[ ${var_while} - 1]
        done

    echo -e "\t 13.3.2 使用多个测试命令"
#        var_more_while=10
#        while echo ${var_more_while}
#               [ ${var_more_while} -ge 0]
#        do
#            echo "This is inside the loop"
#            var_more_while=$[ ${var_more_while} - 1 ]
#        done


echo "================================================================================================================="
echo "13.4 until 命令--要求你指定一个通常返回非零退出状态码的测试命令
                        (有测试命令的退出状态码不为0，bash shell才会执行循环中列出的命令)"
    var_until=100
    until [ ${var_until} -eq 0 ]
    do
        echo ${var_until}
        var_until=$[ $var_until - 25 ]
    done



echo "================================================================================================================="
echo "13.5 嵌套循环--循环语句可以在循环内使用任意类型的命令，包括其他循环命令"
    for (( a = 1; a <= 3; a++ ))
    do
        echo "Starting loop $a:"
            for (( b = 1; b <= 3; b++ ))
            do
                echo " Inside loop: $b"
            done
    done


    var1=5
    while [ ${var1} -ge 0 ]
    do
        echo "Outer loop: $var1"
            for (( var2 = 1; $var2 < 3; var2++ ))
            do
                var3=$[ $var1 * $var2 ]
                echo "  Inner loop: $var1 * $var2 = $var3"
            done
        var1=$[ $var1 - 1 ]
    done


echo "================================================================================================================="
echo "13.6 循环处理文件数据 "
    # 逐行遍历/etc/passwd文件，并将IFS 变量的值改成冒号
    IFS.OLD=$IFS
    IFS=$'\n'
    for entry in $(cat /etc/passwd)
    do
        echo "Values in $entry –"
        IFS=:
        for value in ${entry}
        do
            echo "   $value"
        done
    done


echo "================================================================================================================="
echo "13.7 控制循环"
    echo -e "\t 13.7.1 break 命令"
        echo -e "\t\t 1. 跳出单个循环"
            for i in 1 2 3 4 5 6 7 8 9
            do
                if [ ${i} -eq 5 ];then
                    break
                fi
                echo "Iteration number: $i"
            done
            echo "The for loop is completed"

        echo -e "\t\t 2.跳出内部循环"
        for (( a = 1; a < 4; a++ ))
        do
            echo "Out loop: ${a}"
            for (( b = 1; b < 100; b++ ))
            do
                if [ ${b} -eq 5 ];then
                    break
                fi
            echo " Inner loop: ${b}"
            done
        done

        echo -e "\t\t 3.跳出外部循环"
        for (( a = 1; a < 4; a++ ))
        do
            echo "Outer loop: ${a}"
            for (( b = 1; b < 100; b++))
            do
                if [ ${b} -gt 4 ]
                then
                    break 2
                fi
                echo " Inner loop: ${b}"
            done
        done

    echo -e "\t 13.7.2 continue 命令"
        for (( var1 = 1; var1 < 15; var1++ ))
        do
            if [ ${var1} -gt 5 ] && [ ${var1} -lt 10 ];then
                continue
            fi
            echo "Iteration number: ${var1}"
        done


echo "================================================================================================================="
echo "13.8 处理循环的输出"
    # 1.使用重定向
    for file in /home/rich/*
    do
        if [ -d "${file}" ];then
            echo "${file} is a directory"
        else
            echo "${file} is a file"
        fi
    done > output.txt

    # 2.使用管道
    for state in "North Dakota" Connecticut Illinois Alabama Tennessee
    do
        echo "${state} is the next place to go"
    done | sort


echo "================================================================================================================="
echo "13.9 实例"
    echo "\t 13.9.1 查找可执行文件"
    IFS:
        for folder in ${PATH}
        do
            echo "${folder}:"
            for file in ${folder}/*
            do
                if [ -x ${file} ];then
                    echo " ${file}"
                fi
            done
        done

    echo "\t 13.9.2 创建多个用户账户"
    input="users.csv"
    while IFS=',' read -r userid name
    do
        echo "adding ${userid}"
        useradd -c "${name}" -m ${userid}
    done < "$input"
    # cat users.csv
    # rich,Richard Blum
    # christine,Christine Bresnahan
    # barbara,Barbara Blum
    # tim,Timothy Bresnahan