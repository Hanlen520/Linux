#!/usr/bin/env bash
# by author: jwx522469
# description: 第三章、基本的Bash shell（GNU Bash shell）命令

echo -e "\t 3.1.启动shell---系统启动的shell取决于用户ID的配置"
# cat /etc/passwd     #所有系统用户账户组成的列表
# jiangheng:x:1011:1011::/home/jiangheng:/bin/bash
# 1~7位：用户名、用户密码、用户的系统用户ID编号、用户的系统组ID编号、用户全名、用户的默认主目录、用户的默认shell程序

    echo -e "\t\t bash程序可以使用命令行参数修改启动的shell类型"
        echo -e "\t\t\t参数                    描述"
        echo -e "\t\t\t-c string       从字符串读取命令并进行处理"
        echo -e "\t\t\t-r              启动受限制shell，将用户限制在默认目录"
        echo -e "\t\t\t-i              启动交互shell，允许用户的输入"
        echo -e "\t\t\t-s              从标准输入中读取命令"
    # cat /etc/bash.bashrc   单用户的在~下的.bashrc文件里



echo "================================================================================================================="
echo "3.2.shell提示符"

    echo -e "\t 3.2.1.bash shell的默认提示符是'$'--该符号表示shell等待文本的输入"
    # jiangheng@ESP-vm10:~$
    # 启动shell的用户名---当前虚拟控制台的编号/主机名----当前目录（~代表的是主目录）


    echo -e "\t 3.2.2.控制命令行提示符的环境变量"
    # 深层次的理解：http://www.cnblogs.com/snowsolf/p/3192224.html
    echo ${PS1} # \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$
    echo ${PS2} # >
    echo -e "\t bash shell提示符字符："
    echo -e "\t\t /a      铃声字符 "
    echo -e "\t\t /d      格式为“日 月 年”的日期 "
    echo -e "\t\t /e      ASCII转义字符 "
    echo -e "\t\t /h      本地主机名 "
    echo -e "\t\t /H      完全合格的限定域主机名 "
    echo -e "\t\t /j      shell当前管理的作业数  "
    echo -e "\t\t /l      shell终端的基本名称 "
    echo -e "\t\t /n      ASCII换行字符 "
    echo -e "\t\t /r      ASCII回车"
    # PS1="[\t][\u]\$" 修改控制命令行提示符PS1的环境变量的值，变量的作用域只在本次对话期间有效



echo "================================================================================================================="
echo "3.3.bash手册"
    echo -e "\t man date -- 使用这样的命令格式来查看要了解的命令的具体信息"


echo "================================================================================================================="
echo "3.4.Linux文件系统"
    echo -e "\t 3.4.1.Linux文件系统"
    echo -e "\t\t A.Linux中使用'/'来表示文件路径的目录，'\'在Linux中来表示转义字符"
    echo -e "\t\t B.Linux的文件目录为虚拟目录，不同于windows的文件系统可以知道文件存放在那个物理磁盘中，Linux的文件目录结构为："
    echo -e "\t\t\t 根目录 + 虚拟目录 + 文件"
    echo -e "\t\t C.通用Linux目录名称"
    echo -e "\t\t\t / ---------------- 虚拟目录的根目录，通常此处没有文件 "
    echo -e "\t\t\t /bin ------------- 二进制目录，存储许多GNU用户级别的实用程序 "
    echo -e "\t\t\t /boot ------------ 引导目录，存储引导文件 "
    echo -e "\t\t\t /dev ------------- 设备目录，Linux在该目录中创建设备节点 "
    echo -e "\t\t\t /home ------------ 主目录，Linux在该目录中创建用户目录 "
    echo -e "\t\t\t /lib ------------- 库目录，存储系统和应用程序库文件 "
    echo -e "\t\t\t /media ----------- 媒体目录，可移动设备媒体常用的挂载点 "
    echo -e "\t\t\t /mnt ------------- 挂载目录，另一个可移动媒体设备常用的挂载点 "
    echo -e "\t\t\t /opt ------------- 可选目录，常用于存储可选软件包 "
    echo -e "\t\t\t /root ------------ 根目录 "
    echo -e "\t\t\t /sbin ------------ 系统二进制目录，存储许多GNU管理级别的实用程序 "
    echo -e "\t\t\t /temp ------------ 临时文件，可以在目录中创建或销毁临时工作文件 "
    echo -e "\t\t\t /usr ------------- 用户安装软件的目录 "
    echo -e "\t\t\t /var ------------- 可变目录，用于经常更改的文件，如日志文件 "


    echo -e "\t 3.4.2.浏览目录"
    echo -e "\t\t 切换文件目录：cd '文件目录/空（切换到用户主目录）'"

    echo -e "\t\t A.绝对文件路径：cd '从虚拟目录的根目录开始到文件所在 '"
    pwd  #显示shell会话的当前目录

    echo -e "\t\t B.相对文件路径：cd '指定一个基于当前位置的目标文件路径'"




echo "================================================================================================================="
echo "3.5.文件和目录列表"
    echo -e "\t 3.5.1.基本列表功能"
        ls              # 显示当前目录下的文件和目录
        ls -F           # 区分文件和目录
        ls -a           # 显示隐藏文件、普通文件和目录
        ls -FR          # 列出当前目录下包含的子目录的文件

    echo -e "\t 3.5.2.显示长列表"
        ls -l           # 产生长列表格式的输出
        # ? 文件类型，比如目录（d）、文件（-）、字符型文件（c）或块设备（b）；
        # ? 文件的权限；
        # ? 文件的硬链接总数；
        # ? 文件属主的用户名；
        # ? 文件属组的组名；
        # ? 文件的大小（以字节为单位）；
        # ? 文件的上次修改时间；
        # ? 文件名或目录名

    echo -e "\t 3.5.3.过滤输出列表"
        touch my_script
        ls -l my_script
        touch my_scrapt
        ls -l my_scr?pt     #? 问号（?）代表一个字符
        touch my_file
        ls -l my*           #? 星号（*）代表零个或多个字符
        ls -l my_scr*pt
        touch file fall fill
        ls -l f[a-i]ll      #? []特定范围内的
        ls -l f[!a]ll       #? 将不需要的内容排除在外
        rm file fall fill my_script my_scrapt my_file



echo "================================================================================================================="
echo "3.6.处理文件"

    echo -e "\t 3.6.1.创建文件"
        touch blank_file        # 创建一个空文件
        ls -l --time=atime blank_file       # 查看文件的访问时间

    echo -e "\t 3.6.2.复制文件"
        # cp source(源对象) destination(目标文件)
        cp blank_file blank_file_copy
        ls -l blank_*
        cp -i blank_file blank_file_two
        ls -l blank_*
        rm blank_file
        rm blank_file_copy
        rm blank_file_two
        # cp -R 递归地复制整个目录的内容

    echo -e "\t 3.6.3.制表键自动补全"

    echo -e "\t 3.6.4.链接文件"
        echo -e "\t\t 作用：维护多份备份文件，保存一份物理文件副本和多个虚拟副本文件的方法----虚拟的副本称为链接"
        echo -e "\t\t 软链接与硬链接的区别：软连接的源文件与目标文件的indo编号不一致，目标文件指向源文件，大小也不一样，它
                        可以创建文件/目录的链接文件；
                      硬链接的源文件与目标文件的indo编号一致，目标文件与源文件的大小一致，硬链接不可以创建目录的链接，只能
                        创建文件的链接文件。
                "

        echo -e "\t\t A.符号链接（软链接）---一个实实在在的文件，指向存放在虚拟目录结构中某个地方的另一个文件"
            touch data_file
            ln -s data_file ns_data_file
            ls -l *data_file
            ls -i *data_file    # -i查看文件的inode编号
            rm *data_file

        echo -e "\t\t B.硬链接会创建独立的虚拟文件，包含了原始文件的信息及位置"
            touch code_file
            ln code_file n_code_file
            ls -l *code_file
            ls -li *code_file
            rm *code_file

    echo -e "\t 3.6.5.重命名文件----mv命令可以将文件和目录移动到另一个位置 或重新命名"

    echo -e "\t 3.6.6.删除文件----bash shell中删除文件的命令是rm"
        echo -e "\t\t rm -i 文件     交互式删除"
        echo -e "\t\t rm -f 文件     强制删除"



echo "================================================================================================================="
echo "3.7.处理目录"

    echo -e "\t 3.7.1.创建目录---用mkdir命令,创建多个目录和子目录，需要加入-p参数"
        mkdir new_file
        ls -ld new_file
        rm -rf new_file
        mkdir -p more_dir/firt_layer/second_layer
        ls -R more_dir
#       tree more_dir
        rm -rf more_dir      #一级一级删除rm -ri

    echo -e "\t 3.7.2.删除目录---基本命令是rmdir，默认删除空目录"


echo "================================================================================================================="
echo "3.8.查看文件"

    echo -e "\t 3.8.1.查看文件/文件夹类型---file命令"

    echo -e "\t 3.8.2.查看整个文件"
        echo -e "\t\t A.cat命令：-n加上行号；-b有文本的加上行号；-T不让制表符出现；^I字符替换制表符"
        echo -e "\t\t B.more命令：分页工具"
        echo -e "\t\t C.less命令：less is more----"

    echo -e "\t 3.8.3.查看部分文件"
        echo -e "\t\t A.tail命令：显示文件最后几行的内容，默认文末10行；-n修改要显示的行数；-f其他进程下查看文件，不断显示添加到文件的内容，用于监测系统日志"
        echo -e "\t\t B.head命令：显示文件开头几行内容，默认文头10行；-n修改要显示的行数"




echo "================================================================================================================="
echo "3.9.小结"
    echo -e "\t 1.虚拟目录"
    echo -e "\t 2.操作目录"








