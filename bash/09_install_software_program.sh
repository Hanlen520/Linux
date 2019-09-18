#!/usr/bin/env bash
# @File    :   09_install_software_program.sh
# @Time    :   2019/9/15 13:34
# @Author  :   Crisimple
# @Github :    https:# crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None

# 1. Ubuntu
# 安装软件包
sudo apt install package_name1 package_name2
# 卸载软件包
sudo apt remove package_name1 package_name2
# 更新包索引，需要将本地的包索引和软件包库（会进行更新）的包信息进行同步。
sudo apt update
# 升级软件包
sudo apt upgrade


# ===========================================================================================
# 2. CentOS
# 安装
yum install # 全部安装
yum install package1  # 安装指定的安装包package1
yum groupinsall group1  # 安装程序组group1
# 更新和升级
yum update  # 全部更新
yum update package1  # 更新指定程序包package1
yum check-update  # 检查可更新的程序
yum upgrade package1  # 升级指定程序包package1
yum groupupdate group1  # 升级程序组group1
# 查找和显示
yum info package1  # 显示安装包信息package1
yum list  # 显示所有已经安装和可以安装的程序包
yum list package1  # 显示指定程序包安装情况package1
yum groupinfo group1  # 显示程序组group1信息yum search string 根据关键字string查找安装包
# 删除程序
yum remove | erase package1  # 删除程序包package1
yum groupremove group1  # 删除程序组group1
yum deplist package1  # 查看程序package1依赖情况
# 清除缓存
yum clean packages  # 清除缓存目录下的软件包
yum clean headers  # 清除缓存目录下的 headers
yum clean oldheaders  # 清除缓存目录下旧的 headers
yum clean, yum clean all (= yum clean packages; yum clean oldheaders)  # 清除缓存目录下的软件包及旧的headers
# 源操作
yum repolist/repolist all  # 列出所有源
yum -enablerepo=fedora-source install package1  # 从fedora-source源中安装包package1
# Yum Shell
yum shll  # 进去yum的shell环境


# =========================================================================
# 3. 源码安装
# 解压缩
tar -zxf test-4.0.2.tar.gz
# 进入目录
cd test-4.0.2
# 配置
./configure --prefix=/usr/local/test
# 编译
make all
# 安装
make install && make install-init && make install-commandmode && make install-config