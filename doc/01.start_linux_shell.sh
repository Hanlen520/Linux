#!/usr/bin/env bash
# -*- coding:UTF-8 -*-
# by author: Crisimple
# description: 第一章、初始Linux
echo "==============================一、内核主要的4种功能==================================="

# 一、内核主要的4种功能：
echo "1.系统内存管理："

# 1.系统内存管理
cat /proc/meminfo   #Linux中虚拟内存的当前状态

# 查看当前是那种系统的那个版本
$ cat /etc/issue
Ubuntu 18.04 LTS \n \l


# 2.软件程序管理
# Linux内核创建第一个进程，称之为初始进程，该进程可在系统上启动所有其他进程（在Linux系统上正在运行的程序）
echo "2.软件程序管理："
# cat /etc/inittabs   #进程表

echo "查看Linux系统中当前运行的进程："
ps ax


# 3.硬件管理



# 4.文件系统管理
# Linux的文件管理系统为：ext4文件管理系统
# 文件管理系统：Fat文件管理系统
# Windows的文件管理系统：NTFS文件管理系统