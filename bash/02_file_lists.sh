#!/usr/bin/env bash
# @File    :   02_file_lists
# @Time    :   2019/9/10 20:55
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. 启动 shell
# (1) 查看系统用户账号组成列表，不同位分别代表：
#      用户名、用户密码、用户的系统用户ID编号、用户的系统组ID编号、用户全名、用户的默认主目录、用户的默认shell程序
cat /etc/passwd

# (2) 修改用户启动项 --- shell 启动时加载项的配置文件
# sudo vi /etc/bash.bashrc
#       可自定义启动项：如环境的提示语类【echo -e "\t\t ************* WELCOME CRISIMPLE TO BACK HOME ***************"】
cat /etc/bash.bashrc

# (3) 自定义 bash 命令提示符 --- shell 启动后 bash 显示配置文件
# sudo vi ~/.bashrc
# export PS1="Crisimple@129.28.170.125:~$"
cat ~/.bashrc


# 2. Linux 文件系统
#   /       --- 虚拟目录的根目录
#   /bin    --- 二进制目录，存储许多 GUN 用户级别的实用程序
#   /boot   --- 引导目录，存储引导文件
#   /dev    --- 设备目录，Linux 在该目录中创建设备节点
#   /home   --- 主目录，Linux 在该目录中创建用户目录
#   /lib    --- 库目录，存储系统和应用程序库文件
#   /media  --- 媒体目录，可移动设备媒体常用的挂在点
#   /mnt    --- 挂载目录，另一个可移动设备媒体常用的挂在点
#   /opt    --- 可选目录，常用于存储可选软件包
#   /root   --- 根目录
#   /sbin   --- 系统二进制目录，存储许多 GUN 管理级别的实用程序
#   /temp   --- 临时文件，可以在目录中创建或销毁临时工作文件
#   /usr    --- 用户安装软件的目录
#   /var    --- 可变目录，用于经常更改的文件，如日志文件


# 3. 文件过滤输出显示
ls -l --time=atime file_name        # 查看文件的访问时间
ls -l file_*                        # 【*代表零个或多个字符】查看文件名开头为 file_ 的所有文件
ls -l file_?                        # 【?代表一个字符】查看文件名开头为 file_ 的所有文件
ls -l file_[ai]pt                   # 文件扩展[]中的a和i字符都匹配
ls -l file_[a-i]pt                   # 文件扩展[]中的a-i字符都匹配
ls -F                               # 查看区分文件和目录
ls -a                               # 显示所有文件和目录，包括隐藏文件和目录
ls -FR                              # 显示文件和文件的递归项
ls -l
# 显示长列表
#   文件类型【目录：d；文件：-；字符型文件：c；或块设备：b】
#   文件权限
#   文件的硬链接总数
#   文件属主的用户名
#   文件属主的组名
#   文件的大小（以直接为单位）
#   文件的上次修改时间
#   文件名或目录名


# 4. 处理文件
# (1) 创建文件
touch create_file
# (2) 复制文件
cp create_file copy_create_file
cp -i source_file copy_create_file
# (3) 链接文件
    # ·符号链接---两个通过符号链接在一起的文件，彼此的内容并不相同，也就是两个文件
    ln -s create_file copy_create_file
    # ·硬链接---会创建独立的虚拟文件，其中包含了原始文件的信息及位置。但是它们从根本上而言是同一个文件。
    ln create_file copy_create_file
# (4) 重命名文件 --- inode编号和时间戳保持不变
mv create_file mv_create_file
ls -il mv_create_file
# (5) 删除文件
rm -i mv_create_file
ls -l mv_create_file
mkdir create_floder
rm -i rf create_floder


# 5. 处理目录
# （1）创建目录
#       创建但目录
        mkdir create_floder_two
        ls -ld create_floder_two
#       创建多个目录和子目录
        mkdir -p test1/test2/test3
        ls -R test1
# (2) 删除目录
touch new_dir/my_file
ls -li new_dir/
rm -i new_dir/my_file
ls -ld new_dir
rm -rf new_dir/my_file
ls -ld new_dir


# 6. 查看文件内容
# (1) 查看文件类型
touch new_file
file new_file
mkdir new_dir
file new_dir
# (2) 查看整个文件
    cat new_file
    # -n 参数给所有行加上行号
    cat -n new_file
    # -b 参数只给有文本的行加上行号
    cat -b new_file
    # 不然制表符出现使用参数 —T
    # -T参数会用^I字符组合去替换文中的所有制表符。
    cat -T new_file
    # 分页文件查看
    more /etc/bashrc.bash
    # 分屏显示文件查看
    less /etc/bashrc.bash
# (3) 查看部分文件
    # tail 显示文件最后几行的内容，默认情况下显示文件末尾的10行
    tail new_file
    # tail -n 参数控制显示文件的第多少行的显示
    tail -2 new_file
    # tail -f 实时监测系统日志
    tail -f new_file.log
    # ---------------------------
    # tail 显示文件前几行的内容，默认情况下显示文件开始的10行
    head new_file
    # head -n 参数控制显示文件的第多少行的显示
    head -2 new_file










