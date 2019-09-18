#!/usr/bin/env bash
# @File    :   05_understand_shell.sh
# @Time    :   2019/9/14 10:29
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. shell的类型
# 查看用户的默认shell程序
cat /etc/passwd
ls /bin/bash
# 启动bash shell
/bin/bash
bash
exit
#   Shell 的类型
#       Ubuntu 的 GUN bash shell
#       CentOS 的 tcsh shell
#       Debian 的 ash shell



# 2. shell 的父子关系
ps -f
bash
bash
bash
# 展示 shell 之间的嵌套结构
ps --forest
# 通过 PPID 列可以显示出是谁的父进程
ps -f
# 退出进程
exit

# 2.1 进程列表
# 在一行中指定要一次运行的一系列命令，命令之间用英文分号隔开
 pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls
# 实现命令列表实现要将命令放在括号中执行，生成了一个子 shell 来执行对应的命令
(pwd ; ls ; cd /etc ; pwd ; cd ; pwd ; ls)
# 查看 "命令列表" 是否生成了子 shell，使用命令 echo $BASH_SUBSHELL;(如果返回是0，就表明没有子shell；如果返回1或者更大的数字，就表明存在子 shell)
(pwd; echo $BASH_SUBSHELL)

# 2.2 特殊的 shell 用法
# 会话暂停10s，后台模式等待
sleep 10&
# 查看后台作业, -l显示出命令的PID
jobs -l
# ---------------------------
# 将相同的的进程列表置入后台模式
(sleep 2; echo $BASH_SUBSHELL; sleep 2)&
# ---------------------------
coproc My_Job {sleep 10;}
iobs
ps --forest


# 3. shell的内建命令
# 3.1 外部命令
which ps
type -a ps
ps
ps -f
# 3.2 内建命令
type cd
type exit
# echo 和 pwd 既有内建命令，也有外建命令
# which只显示外键命令，type -a 既显示内建命令也显示外键命令
which echo
type -a echo
which pwd
type -a pwd
# (1) history命令
history
## !!+回车 --- 显示上一条命令记录
## !20 --- 显示编号为20的命令记录
# 命令历史记录会被写进 .bash_history
cat .bsah_histroy
# (2) 命令命名
# 查看当前可用的别名
alias -p
# 自定义别名
alias li ='ls -li'