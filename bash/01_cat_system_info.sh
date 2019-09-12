#!/usr/bin/env bash
# @File    :   01_cat_system_info.sh
# @Time    :   2019/9/9 7:55
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# Linux 内核的四种功能

# （1）内存管理
# 查看虚拟内存的当前状态
cat /proc/meminfo
# 查看当前系统版本
cat /etc/issue


# （2）软件程序管理
# Linux内核创建第一个进程，称之为初始进程，该进程可在系统上启动所有其他进程（在Linux系统上正在运行的程序）
cat /etc/inittabs   #进程表
# 查看Linux系统中当前运行的进程
# PS，是Linux系统命令之一，是在Linux中是查看进程的命令。ps查看正处于Running的进程，ps aux查看所有的进程。
# 参数如下:
#       -e 显示所有进程。
#       -f 全格式。
#       -h 不显示标题。
#       -l 长格式。
#       -w 宽输出。
#       a 显示终端上的所有进程，包括其他用户的进程。
#       r 只显示正在运行的进程。
#       x 显示没有控制终端的进程。
#       --help 显示帮助信息。
#       --version 显示该命令的版本信息。
ps -ax  # 查看全部进程
ps -ef  # 查看全格式的全部进程
ps -ef | grep "进程名" # 查看并筛选 跟进程名有关的进程，该进程名可以是进程的全部或者部分

# （3）硬件管理

# （4）文件系统管理