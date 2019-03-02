#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第九章 安装软件程序

echo "================================================================================================================="
echo "9.1 包基础管理--包管理系统PMS【dpkg(Ubuntu)和rpm】"


echo "================================================================================================================="
echo "9.2 基于Debian的系统--dpkg是软件包管理系统工具，而aptitude则是完整的软件包管理系统"
    echo -e "\t\t 9.2.1 用aptitude管理软件包"
        echo -e "\t\t 1.
                dpkg -L (package)_name  列出vim-common软件包所安装的全部文件;
                dpkg --search absolute_file_name   反向操作，查找某个特定文件属于哪个软件包(使用的时候必须用绝对文件路径)"

    echo -e "\t\t 9.2.2 用aptitude安装软件包"
        echo -e "\t\t 2.
                aptitude search package_name 找到特定的软件包,看到一个i,个包现在已经安装"

    echo -e "\t\t 9.2.3 用aptitude更新软件 --- aptitude safe-upgrade"

    echo -e "\t\t 9.2.4 用aptitude卸载软件
                只删除软件包而不删除数据和配置文件，可以使用aptitude的remove选项；
                要删除软 件包和相关的数据和配置文件，可用purge选项；
                要看软件包是否已删除，可以再用aptitude的search选项【c意味着软件已删除；p配置文件也已删除】"

    echo -e "\t\t 9.2.5 aptitude仓库的默认位置再文件/etc/apt/sources. list中"


echo "================================================================================================================="
echo "9.3 基于Red Hat的系统[ yum：在Red Hat和Fedora中使用。  urpm：在Mandriva中使用。  zypper：在openSUSE中使用。]"
    echo -e "\t\t 9.3.1 列出已安装包：yum list installed
                        yum provides file_name 找出系统上的某个特定文件属于哪个软件包；"

    echo -e "\t\t 9.3.2 用yum安装软件：yum install package_name
                        yum localinstall package_name.rpm  本地安装"

    echo -e "\t\t 9.3.3 用yum 更新软件
                        yum list updates 要列出所有已安装包的可用更新;
                        yum update 更新所有的包；
                        yum update package_name 更新特定的软件包"

    echo -e "\t\t 9.3.4 用yum 卸载软件
                        yum remove package_name 只删除软件包而保留配置文件和数据文件；
                        yum erase package_name  要删除软件和它所有的文件，就用erase选项"

    echo -e "\t\t 9.3.5 处理损坏的包依赖关系"

    echo -e "\t\t 9.3.6 yum 软件仓库
                yum repolist 正从哪些仓库中获取软件"

echo "================================================================================================================="
echo "9.4 从源码安装"