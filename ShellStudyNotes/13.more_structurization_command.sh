#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: ��ʮ���� ����Ľṹ������

echo "================================================================================================================="
echo "13.1 for����"
    echo -e "\t 13.1.1 ��ȡ�б��е�ֵ"
        for company in Alibaba Baidu Tencent Xiaomi Jingdong
        do
            echo The next state is ${company}
        done

    echo -e "\t 13.1.2 ��ȡ�б��еĸ���ֵ"
        for goto in Nevade "New York" "New Mexico"
        do
            echo Now I will go to ${goto}
        done

    echo -e "\t 13.1.3 �ӱ�����ȡ�б� "
        list="Alibaba Baidu Tencent Xiaomi Jingdong"
        list=${list}"Huawei"
        for state in ${list}
        do
            echo How are ever visted ${state}?
        done

    echo -e "\t 13.1.4 �������ȡֵ--�������滻��ִ���κ��ܲ��� ��������Ȼ����for������ʹ�ø���������"
        echo "Alibaba Baidu Tencent" >> states
        file="states"  # states��ǰд�õ�һ���ļ�
        for state in $(cat ${file})
        do
            echo "Visit beautiful $state"
        done
        # rm states

    echo -e "\t 13.1.5 �����ֶηָ���[��������IFS�������ڲ��ֶηָ���(�ո��Ʊ�������з�)]"
        # ָ�����IFS�ַ���ֻҪ�������ڸ�ֵ�д��������С� IFS=$'\n':;"
        file="states"
        IFS=$'\n'
        for state in $(cat ${file})
        do
            echo "Visit beautiful ${state}"
        done
        rm states

    echo -e "\t 13.1.6 ��ͨ�����ȡĿ¼"
        for file in /home/Crisimple/test/*
        do
            if [ -d "$file" ];then
                echo "$file is a directory"
            elif [ -f "$file" ];then
                echo "$file is a file"
            fi
        done



echo "================================================================================================================="
echo "13.2 C���Է���for����"
    echo -e "\t 13.2.1 C���Ե�for����"
        #    for (i =0; i < 10; i++){
        #        printf("The next number is %d\n", i);
        #   }
        for (( i=1; i <= 10; i++ ))
        do
            echo "The next number is $i"
        done

    echo -e "\t 13.2.2 ʹ�ö������ "
        for (( a=1, b=10; a <= 10; a++, b-- ))
        do
            echo "$a - $b"
        done


echo "================================================================================================================="
echo "13.3 while ����--��test����ط����˳�״̬��ʱ��while�����ִֹͣ����������."
    echo -e "\t 13.3.1 while �Ļ�����ʽ--�÷����������ѭ���������õ���shell������ֵ"
        var_while=10
        while [ ${var_while} -gt 0 ]
        do
            echo ${var_while}
            var_while=$[ ${var_while} - 1]
        done

    echo -e "\t 13.3.2 ʹ�ö����������"
#        var_more_while=10
#        while echo ${var_more_while}
#               [ ${var_more_while} -ge 0]
#        do
#            echo "This is inside the loop"
#            var_more_while=$[ ${var_more_while} - 1 ]
#        done


echo "================================================================================================================="
echo "13.4 until ����--Ҫ����ָ��һ��ͨ�����ط����˳�״̬��Ĳ�������
                        (�в���������˳�״̬�벻Ϊ0��bash shell�Ż�ִ��ѭ�����г�������)"
    var_until=100
    until [ ${var_until} -eq 0 ]
    do
        echo ${var_until}
        var_until=$[ $var_until - 25 ]
    done



echo "================================================================================================================="
echo "13.5 Ƕ��ѭ��--ѭ����������ѭ����ʹ���������͵������������ѭ������"
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
echo "13.6 ѭ�������ļ����� "
    # ���б���/etc/passwd�ļ�������IFS ������ֵ�ĳ�ð��
    IFS.OLD=$IFS
    IFS=$'\n'
    for entry in $(cat /etc/passwd)
    do
        echo "Values in $entry �C"
        IFS=:
        for value in ${entry}
        do
            echo "   $value"
        done
    done


echo "================================================================================================================="
echo "13.7 ����ѭ��"
    echo -e "\t 13.7.1 break ����"
        echo -e "\t\t 1. ��������ѭ��"
            for i in 1 2 3 4 5 6 7 8 9
            do
                if [ ${i} -eq 5 ];then
                    break
                fi
                echo "Iteration number: $i"
            done
            echo "The for loop is completed"

        echo -e "\t\t 2.�����ڲ�ѭ��"
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

        echo -e "\t\t 3.�����ⲿѭ��"
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

    echo -e "\t 13.7.2 continue ����"
        for (( var1 = 1; var1 < 15; var1++ ))
        do
            if [ ${var1} -gt 5 ] && [ ${var1} -lt 10 ];then
                continue
            fi
            echo "Iteration number: ${var1}"
        done


echo "================================================================================================================="
echo "13.8 ����ѭ�������"
    # 1.ʹ���ض���
    for file in /home/rich/*
    do
        if [ -d "${file}" ];then
            echo "${file} is a directory"
        else
            echo "${file} is a file"
        fi
    done > output.txt

    # 2.ʹ�ùܵ�
    for state in "North Dakota" Connecticut Illinois Alabama Tennessee
    do
        echo "${state} is the next place to go"
    done | sort


echo "================================================================================================================="
echo "13.9 ʵ��"
    echo "\t 13.9.1 ���ҿ�ִ���ļ�"
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

    echo "\t 13.9.2 ��������û��˻�"
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