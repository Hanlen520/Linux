#!/usr/bin/env bash

echo "==============================一、内核主要的4种功能==================================="

# 一、内核主要的4种功能：

echo "1.系统内存管理："

# 1.系统内存管理

cat /proc/meminfo   #Linux中虚拟内存的当前状态





# 2.软件程序管理

# Linux内核创建第一个进程，称之为初始进程，该进程可在系统上启动所有其他进程（在Linux系统上正在运行的程序）

echo "2.软件程序管理："

# cat /etc/inittabs   #进程表



echo "查看Linux系统中当前运行的进程："

ps ax





# 3.硬件管理



# 4.文件系统管理





echo "===============================二、GNU实用程序========================================"

echo "1.核心GNU实用程序"

echo "处理文件的实用程序"

echo "操作文件的实用程序"

echo "管理进程的实用程序"



echo "2.shell"





echo "=================================三、Linux桌面环境===================================="

echo "1.X windows系统"

echo "2.KDE桌面"

echo "3.GNOME桌面"



echo "2.1.模拟终端"



echo "2.2.terminfo数据库"

# 数据库所在的位置：

#cat /etc/terminfo

#cat /usr/share/terminfo

#cat /lib/terminfo



echo "2.3.Linux控制台"



echo "2.4.xterm控制台"



echo "2.5.Konsole终端"



echo "2.6.GNOME终端"