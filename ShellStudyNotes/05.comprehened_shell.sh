#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: comprehened shell

echo "================================================================================================================="
echo "5.1 shell的类型"
    # cat /etc/passwd # 用户ID配置
    ls -lF /bin/bash    # bash shell程序位于/bin目录内



echo "================================================================================================================="
echo "5.2 shell的父子关系"
    bash
    bash
    bash
    ps -forest
    echo -e "\t bash命令行参数"
        echo -e "\t -c string 从string中读取命令并进行处理 "
        echo -e "\t -i 启动一个能够接收用户输入的交互shell "
        echo -e "\t -l 以登录shell的形式启动 "
        echo -e "\t -r 启动一个受限shell，用户会被限制在默认目录中 "
        echo -e "\t -s 从标准输入中读取命令  "

    echo -e "\t 5.2.1 进程列表--依次运行的一系列命令，命令 之间加入分号（;）即可 "
        pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls
        (pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls)      # 进程列表，生成了一个子shell来执行对应的命令
        echo -e "\t\t 查看是否生成了子shell[ $BASH_SUBSHELL--命令返回0，就表明没有子shell；返回 1或者其他更大的数字，就表明存在子shell]"

    echo -e "\t 5.2.2 别出心裁的子shell用法 "
        echo -e "\t\t 1.探索后台模式----利用sleep"
#            sleep 3&
#            ps -f
            echo -e "jobs -l 命令可以显示出当前运行 在后台模式中的所有用户的进程（作业）和命令的PID"


        echo -e "\t\t 2. 将进程列表置入后台"
        echo -e "\t\t 3.协程---要进行协程处理，得使用coproc命令，还有要在子shell中执行的命令；扩展名字语法： coproc My_Job { sleep 10; } "



echo "================================================================================================================="
echo "5.3 理解shell的内建命令"
    echo -e "\t 5.3.1 外部命令--文件系统命令，通常位于/bin、/usr/bin、/sbin或/usr/sbin中"
        which ps

    echo -e "\t 5.3.2 内建命令--内建命令和外部命令的区别在于前者不需要使用子进程来执行，用type命令来了解某个命令是否是内建的"
        type cd
        type echo
    # 命令type -a显示出了每个命令的两种实现。注意，which命令只显示出了外部命令文件。
        type -a pwd
        which pwd
        type -a echo
        which echo

        echo -e "\t\t\t 1.history[cat .bash_history]--要查看最近用过的命令列表"
            history

        echo -e "\t\t\t 2.2.命令别名 --alias命令；-p查看当前可用 的别名"


echo "================================================================================================================="
echo "5.4 小结"
