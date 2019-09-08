#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: ��ʮ���� ʹ�ýṹ������--����һ��������������ʹ�ű��� ��ĳЩ�����Ϊ�ṹ������

echo "================================================================================================================="
echo "12.1 ʹ��if-then���"
    if pwd ;then
        echo  "It worked"
    fi
    # ����û��Ƿ��½��
    test_user=crisimple
    if grep ${test_user} /etc/passwd; then
        echo "hello" ${test_user}
        ls -a /home/${test_user}.b*
    fi

echo "================================================================================================================="
echo "12.2 if-then-else���"
    t_user=Crisimple
    if grep ${t_user} /etc/passwd ;then
        echo "The bash files for user ${t_user} are: "
        ls -a /home/${t_user}/.b*
    else
        echo "The user ${t_user} dose not exits on this system"
        echo
    fi

echo "================================================================================================================="
echo "12.3 Ƕ��if"
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
    # ������������������������������������������������������������������������������������������������������������������������������������������������
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
echo "12.4 test���test�����ṩ����if-then����в��Բ�ͬ������;��"
    echo -e "\t 12.4.1 ��ֵ�Ƚ�"
        echo -e "\t\t -eq��ȣ�-ge���ڵ��ڣ�-gt���ڣ�-leС�ڵ��ڣ�-ltС�ڣ�-ne������"

    echo -e "\t 12.4.2 �ַ����Ƚ�"
        echo -e "\t\t =��ͬ��!=����ͬ��<С��>�󣨴��ںź�С�ںű���ת�壬����shell������ǵ����ض�����ţ����ַ���ֵ�����ļ�����
                                                ��д��ĸ����Ϊ��С��Сд��ĸ�ġ���sort����ǡ���෴����
                      -n�Ƿ��0��-z�Ƿ�Ϊ0"

    echo -e "\t 12.4.3 �ļ��Ƚ� "
        echo -e "\t\t   -d file�Ƿ���ڲ���һ��Ŀ¼��-e file�Ƿ���ڣ�-f file�Ƿ���ڲ���һ���ļ��� -r file�Ƿ���ڲ��ɶ���
                        -s file�Ƿ���ڲ��ǿգ�      -w file�Ƿ���ڲ���д��  -x file�Ƿ���ڲ���ִ�У�
                        -O file�Ƿ���ڲ����ڵ�ǰ�û���         -G file�Ƿ���ڲ���Ĭ�����뵱ǰ�û���ͬ��
                        file1 -nt file2 ���file1�Ƿ��file2�£�   file1 -ot file2 ���file1�Ƿ��file2��"


echo "================================================================================================================="
echo "12.5 ������������  && || "



echo "================================================================================================================="
echo "12.6 if-then �ĸ߼�����"
    echo -e "\t\t 12.6.1 ʹ��˫����--�������ڱȽϹ�����(��������������������ѧ��ֵ��Ƚϱ��ʽ) "
            echo -e "\t\t val++ 	 ���� "
            echo -e "\t\t val-- 	 ��� "
            echo -e "\t\t ++val 	 ���� "
            echo -e "\t\t --val 	 �ȼ� "
            echo -e "\t\t ! 		 �߼��� "
            echo -e "\t\t ~ 		 λ�� "
            echo -e "\t\t ** 		 ������ "
            echo -e "\t\t <<         ��λ��  "
            echo -e "\t\t >>         ��λ��  "
            echo -e "\t\t &          λ������  "
            echo -e "\t\t |          λ������  "
            echo -e "\t\t &&         �߼���  "
            echo -e "\t\t ||         �߼���  "

    echo -e "\t\t 12.6.2 ʹ��˫������--[���������Ǳ�׼�ַ����Ƚ�]"


echo "================================================================================================================="
echo -e "12.7 case ����---Ϊ�Ƚϱ���Ѱ���ض���ֵ��case���������б��ʽ����鵥�������Ķ��ֵ"
    course=math
    case ${course} in
    english)
        echo "I like ${course}";;
    math)
        echo "I like ${course}";;
    *)
        echo "I like play";;
    esac

echo "==================================================�žų˷���======================================================"
for (( i = 1; i <= 9; i++))
do
    for (( j = i; j <= 9; j++))
    do
        echo "${i} * ${j}" = `expr ${i} \* ${j}`
    done
done

