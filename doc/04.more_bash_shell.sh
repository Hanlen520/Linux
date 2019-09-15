#!/bin/bash
# -*- coding:utf-8 -*-
# by author: Crisimple
# description: 第四章、更多的bash shell命令

echo "4.1.监测程序"
    echo -e "\t 4.1.1 探查进程"
        ps -ef      # 显示系统上的进程，并扩展输出
        # ps --forest     # 显示进程的层次信息
        # --help 			显示帮助信息
        # --info			显示调试信息
        # --version		显示ps程序的版本
        # ps -aux | grep PID


    echo -e "\t 4.1.2 实时监测程序"
        # top       实时显示进程的概要信息
        # t				切换CPU信息行显示
        # o				更改信息列的显示顺序
        # k				杀死特定的进程
        # q				退出top命令


echo -e "\t 4.1.3 结束进程"
        echo -e "\t\t kill命令（root用户）+ PID；-s参数支持指定其他信号"
        echo -e "\t\t killall命令 + 进程名"

echo -e "\t 4.1.4 三种不同风格的参数"
        # * Unix 类型参数，前面有一短划线
        #
        # 参数            描述
        # -A				显示所有进程
        # -e				显示所有进程
        # -f				显示完整的格式列表
        # -l				显示长列表
        # -H				以层级格式显示进程

        # * BSD 类型参数，前面没有有短划线
        #
        # 参数            描述
        # T				显示与该终端的相关的所有进程
        # l				显示长格式
        # r				只显示正在运行的进程
        # f				以层级格式显示进程,显示哪个

        # * GNU长参数，前面有双短划线
        #
        # 参数            描述
        # --forest		在层次结构清单中显示进程，以显示父进程
        # --help 			显示帮助信息
        # --info			显示调试信息
        # --version		显示ps程序的版本






echo "================================================================================================================="
echo "4.2 监测磁盘空间：http://linux.chinaunix.net/techdoc/beginner/2007/03/30/953684.shtml"
    echo -e "\t 4.2.1 挂载存储媒体"
        mount
        # mount命令提供如下四部分信息： ? 媒体的设备文件名 ? 媒体挂载到虚拟目录的挂载点 ? 文件系统类型 ? 已挂载媒体的访问状态
        # 手动挂载媒体设备的基本命令：
        # mount -t type device directory     type参数指定了磁盘被格式化的文件系统类型--vfat/ntfs/iso9660
        echo -e "\t\t mount命令的参数 "
              echo -e "\t\t -a 挂载/etc/fstab文件中指定的所有文件系统  "
              echo -e "\t\t -f 使mount命令模拟挂载设备，但并不真的挂载 "
              echo -e "\t\t -F 和-a参数一起使用时，会同时挂载所有文件系统 "
              echo -e "\t\t -v 详细模式，将会说明挂载设备的每一步 "
              echo -e "\t\t -I 不启用任何/sbin/mount.filesystem下的文件系统帮助文件 "
              echo -e "\t\t -l 给ext2、ext3或XFS文件系统自动添加文件系统标签 "
              echo -e "\t\t -n 挂载设备，但不注册到/etc/mtab已挂载设备文件中 "
              echo -e "\t\t -p num 进行加密挂载时，从文件描述符num中获得密码短语 "
              echo -e "\t\t -s 忽略该文件系统不支持的挂载选项 "
              echo -e "\t\t -r 将设备挂载为只读的 "
              echo -e "\t\t -w 将设备挂载为可读写的（默认参数） "
              echo -e "\t\t -L label 将设备按指定的label挂载 "
              echo -e "\t\t -U uuid 将设备按指定的uuid挂载 "
              echo -e "\t\t -O 和-a参数一起使用，限制命令只作用到特定的一组文件系统上 "
              echo -e "\t\t -o 给文件系统添加特定的选项 "

        # mount o username=***,passwd=*** //被挂载的文件的全路径 挂载点

        # umount      # 卸载设备的命令：格式--umount [directory | device ] ，系统文件不允许卸载


    echo -e "\t 4.2.2 使用df命令-----查看所有已挂载磁盘的使用情况；-h按照用户易读的形式显示"
        # 命令输出如下：
        #  设备的设备文件位置；  能容纳多少个1024字节大小的块；  已用了多少个1024字节大小的块；
        #  还有多少个1024字节大小的块可用；  已用空间所占的比例；  设备挂载到了哪个挂载点上
        # 如果在卸载设备时，系统提示设备繁忙，无法卸载设备， losf命令获得使用它的进程信息



    echo -e "\t 4.2.3 使用du 命令"
       # -c：显示所有已列出文件总的大小
       # -h：按用户易读的格式输出大小，即用K替代千字节，用M替代兆字节，用G替代吉字节
       # -s：显示每个输出参数的总计



echo "================================================================================================================="
echo "4.3 处理数据文件"
    echo -e "\t\t 4.3.1 排序数据-----sort命令：对数据进行排序-默认语言的排序规则对文本文件中的数据行排序；-n按值排序；-M按月排序"
                # grep命令可以对文件进行搜索
                # $grep aa file1 搜索包含 aa 的文本
                # $grep 1 file1  搜索包含 t 的文本
                #
                # 反转搜索 $grep -v t file1
                #
                # 想要获取与模式匹配的数据所在的行号，可以使用 -n
                # $grep -n t file1
                #
                # 如果只需要了解有多少包含匹配模式可以用-c
                # $grep -c t file1
                #
                # 如果需要指定多个匹配模式，可以使用-e
                # $grep -e t file1 -e 1 file1
                #
                # 查找包含t或f字符的数据
                # $grep 【tf】 file1

    echo -e "\t\t 4.3.2 搜索数据-----grep [options] pattern [file]；-v反向搜索；-n显示匹配模式的行所在的行号；"
       # grep 要搜索的内容 目标文件
       # grep -h maven ./ --max-depth=1

    echo -e "\t\t 4.3.3 压缩数据-----压缩工具：gzip(.gz);zip(.zip)"
        echo -e "\t\t\t gzip: 用来压缩文件"
        echo -e "\t\t\t gzcat: 用来查看压缩过的文本文件的内容"
        echo -e "\t\t\t gunzip: 用来解压文件"
            # 1）bxip2工具
            #
            # bxip2：用于压缩文件
            # bzcat：用于显示已压缩的的文件内容
            # bunzip2：用于解压.bz2文件
            # bzip2recover:用于尝试恢复受损的压缩文件
            #
            # $bzip2 文件名
            #
            # （2）gzip工具
            #
            # gzip:用于压缩文件
            # gzcat：用于显示已压缩的的文件内容
            # gunzip：用于解压文件
            #
            # $gzip 文件名
            # gzip可以指定多个文件或者使用通配符一次压缩多个文件
            # $gzip my*
            #
            # （3）zip工具
            #
            # zip：用于创建包含列出文件和目录的压缩文件
            # zipcloak：用于创建包含列出文件和目录的压缩加密文件
            # zipnote：用于提取zip文件中注释
            # z ipsplit：用于将zip文件分割成指定大小的多个小文件
            # unzip：用于提取压缩zip文件中的文件和目录
            #
            # zip工具的强之处在于能够将文件的整个目录压缩为一个文件
            # $zip -r testzip test


echo -e "\t\t 4.3.4 归档数据---tar命令【格式：tar function [options] object1 object2 ... 】"
        echo -e "\t\t\t  tar命令的功能 "
        echo -e "\t\t\t -A --concatenate 将一个已有tar归档文件追加到另一个已有tar归档文件"
        echo -e "\t\t\t -c --create 创建一个新的tar归档文件"
        echo -e "\t\t\t -d --diff 检查归档文件和文件系统的不同之处"
        echo -e "\t\t\t     --delete 从已有tar归档文件中删除 -r"
        echo -e "\t\t\t --append 追加文件到已有tar归档文件末尾"
        echo -e "\t\t\t -t --list 列出已有tar归档文件的内容"
        echo -e "\t\t\t -u --update 将比tar归档文件中已有的同名文件新的文件追加到该tar归档文件中"
        echo -e "\t\t\t -x --extract 从已有tar归档文件中提取文件"

        echo -e "\t\t\t tar命令选项 "
        echo -e "\t\t\t -C dir 切换到指定目录 "
        echo -e "\t\t\t -f file 输出结果到文件或设备file "
        echo -e "\t\t\t -j 将输出重定向给bzip2命令来压缩内容 "
        echo -e "\t\t\t -p 保留所有文件权限 "
        echo -e "\t\t\t -v 在处理文件时显示文件 "
        echo -e "\t\t\t -z 将输出重定向给gzip命令来压缩内容 "
        # tar命令用于将文件归档
        # tar function [options] object1 object2 ...
        #
        # tar -cvf test.tar test1/ test2
        # 创建一个名称为test.tar的归档文件，其中包含test1目录和test2目录的内容
        #
        # tar -tf test.tar
        # 列出文件内容但不解压
        #
        # tar -xvf test.tar
        # 解压文件内容


