#!/usr/bin/env bash
# @File    :   01_配置版本库.sh
# @Time    :   2019/9/30 10:02
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 创建仓库repository目录
mkdir MySpace
cd MySpace
touch test.txt
touch test.doc


# 初始化仓库，然后这个仓库下的所有文件都会被git监视
git init
ls -ah
# 将文件添加到暂存区stage
git add test.txt test.doc  # 或 git add .
# 将文件提交到仓库，-m 后面是提交的备注信息
git commit -m "add test.txt file"
# 上面两步可以合并成一步操作，它会自动跟踪并提交有修改的文件；一般不推荐这种方法，因为它不能将文件添加到git管理里的
git commit -a "add test.txt file"


# 先GitHub推送需要先添加ssh-keygen
cd ~/.ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub


# 将仓库里的数据提交到远程仓库（如：GitHub）
# GitHub中https://github.com/new新建远程仓库
# 将本地仓库与远程仓库关联
git remote add origin git@github.com:Crisimple/test_repository.git
# 把本地库的所有内容推送到远程库上
git push -u origin master  # 首次向远程仓库推送加-u


# 从远程库克隆数据
git clone git@github.com:crisimple/test_repository.git
git clone https://github.com/crisimple/test_repository.git      # 速度慢每次推送还得输入口令，不建议使用


