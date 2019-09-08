#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description:
#=======================================================================================================================
# 14.1 理解输入和输出
    # 14.1.1 标准文件描述符
        # 1.STDIN --- 文件描述符：0；标准输入

        # 2.STDOUT --- 标准的shell输出

        # 3.STDERR --- 处理错误消息

    # 14.1.2 重定向错误
        # 1.只重定向错误
            ls -al test badtest test2 2> test5
        # 2.重定向错误和数据
            ls -al test test2 test3 badtest 2> test6 1> test7   # 将错误和数据分别重定向到各自的文件
            ls -al test test2 test3 badtest &> test8    # 错误和数据重定向到一个文件


#=======================================================================================================================
# 14.2 在脚本中重定向输出
    # 14.2.1 临时重定向---在重定向到文件描述符时，必须在文件符数字之前加&
        #!/bin/bash
        # by author:
        # description: testing STDERR message; temp_redirect.sh
        echo "This is an error" >&2
        echo "This is an normal output"

        ./temp_redirect.sh 2> test_temp_redirect.txt

    # 14.2.2 永久重定向---如果有大量的重定向，用exec命令告诉shell在脚本执行期间重定向某个特定文件描述符
        #!/bin/bash
        # by author:
        # description: redirecting all output to a file; forever_redirect.sh
        exec 1> forever_redirect.txt
        echo "This is a redirecting all output to a file command"
        echo "form a script to another file"
        echo "without having to redirect every individual line"

        exec 2> testerror.txt
        echo "This is the start of the script"
        echo "now redirecting all output to another location"

        exec 1>testout.txt
        echo "This output should go to the testout.txt file"
        echo "but this should go to the testerror.txt file" >&2

        ./forever_redirect.sh


#=======================================================================================================================
# 14.3 在脚本中重定向输入--将STDIN从键盘重定向到其他位置
    #!/bin/bash
    # by author:
    # description:
    exec 0< input_file.txt
    count=1
    while read line
    do
        echo "Line #${count}: ${line}"
        count=$[ ${count} + 1 ]
    done


#=======================================================================================================================
# 14.4 创建自己的重定向：3-8的文件描述符均可使用
    # 14.4.1 创建输出文件描述符
        #!/bin/bash
        # by author:
        # description: using the alternative file descriptor; customize_redirect.sh
        exec 3>customize_out.txt
        echo "This should display on the monitor"
        echo "and it should be stored in the file" >&3
        echo "Then it should be back display on the monitor"

        ./customize_redirect.sh


    # 14.4.2 重定向文件描述符
        #!/bin/bash
        # by author:
        # description:
        exec 3>&1 # 3冲定向到文件描述符1的当前位置，也就是标准输出，输出到屏幕上
        exec 1>redirect_description_symbol.txt
        echo "This should stored in the output file."
        echo "along with this line."
        exec 1>&3
        echo "Then this will display on the monitor."



    # 14.4.3 创建输入文件描述符--在冲定向到文件之前，先将STDIN文件描述符保存到另外一个文件描述符，然后在读取完文件之后再将STDIN恢复到它原来的位置
        #!/bin/bash
        # by author:
        # description: Build yourself input file description symbol; redirect_input.sh
        exec 6<&0
        exec 0< redirect_input.txt
        count=1
        while read line
        do
            echo "Line #${count}: $line"
            count=$[ $count + 1 ]
        done
        exec 0<&6
        read -p "Are you done now?" answer
            case ${answer} in
                Y | y) echo "GoodBye";;
                N | n) echo "Sorry, this is the end.";;
            esac

        ./redirect_input.sh


    # 14.4.4 创建读写文件描述符--用同一个文件描述符来从文件中读取数据，并将数据写到同一个文件中去
        #!/bin/bash
        # by author:
        # description:
        exec 3<> input_output_file
        read line <&3
        echo "Read: $line"
        echo "This is a test line" >&3

        ./input_output_file


    # 14.4.5 关闭文件描述符---脚本结束前手动关闭文件描述符&-
        #!/bin/bash
        # by author:
        # description:
        exec 3>close_redirect.sh
        echo "This is a test line of data" >&3
        exec 3>&-
        echo "This will not work" >&3

#=======================================================================================================================
# 14.5 列出打开的文件描述符---lsof命令
    #!/bin/bash
    # by author:
    # description: lsof_look.sh
    # COMMAND---正在运行的命令行名的前9个字符    PID---进程的PID   USER---进程属主的登录名  FD---文件描述符数目以及访问类型
    # TYPE---文件的类型（CHAR-字符；BLK-块型；DIR-目录；REG-常规文件）  DEVICE---设备的设备号（主设备和从设备）SIZE---文件的大小
    # NODE---本地文件的节点数    NAME---文件名
    exec 3> test18file1
    exec 6> test18file2
    exec 7< testfile
    /usr/sbin/lsof -a -p $$ -d 1.2.3.6.7

    ./lsof_look.sh


#=======================================================================================================================
# 14.6 阻止命令输出--不想显示脚本的输出，将STDERR重定向到一个称做null文件的特殊文件
    # ls -al > /dev/null
    # cat /dev/null
    # ls -al badfile test16 2> /dev/null
    # 快速移除现有文件中的数据
    # cat /dev/null > testfile
    # cat testfile


#=======================================================================================================================
# 15.7 创建临时文件---Linux使用/tmp目录存放不需要永久保留的文件，任何账户在该目录下读写文件
    # 15.7.1 创建本地临时文件---mktemp会在本地目录中创建一个文件，创建多 个临时文件，它可以保证每个文件都是唯一的
        #!/bin/bash
        # by author: Crisimple
        # description: make the temp file used mktemp; make_local_temp.sh
        mktemp make_temp_file.XXXXXX
        ls -al make_temp_file*

        # description: creating and using a temp file in shell script
        tempfile=`mktemp make_tempfile_inScript.XXXXXX`
        exec 3<${tempfile}
        echo "This script write to temp file: ${tempfile}"
        echo "This is the first line" >&3
        echo "This is the second line" >&3
        echo "This is the third line" >&3
        esec 3>&-

        echo "Done creating temp file. The contents are:"
        cat ${tempfile}
        rm -rf ${tempfile} 2>/dev/null

    # 15.7.2 在/tmp目录创建临时文件----t选项会强制mktemp命令来在系统的临时目录来创建该文件
        #!/bin/bash
        # by author: Crisimple
        # description: make temp file in tmp dir
        # 在mktemp创建临时文件时，它会将全路径名返回给变量。这样你就能在任何命令中使用该 值来引用临时文件了。
        mktemp -t test.XXXXXX
        ls -al /tmp/test*

    # 15.7.3 创建临时目录----d选项告诉mktemp命令来创建一个临时目录而不是临时文件
        #!/bin/bash
        # by author: Crisimple
        # description: create temp directory
        tempdir=`mktemp -d tempdir.XXXXXX`
        cd ${tempdir}
        tempfile1=$(mktemp temp.XXXXXX)
        tempfile2=$(mktemp temp.XXXXXX)
        exec 7> ${tempfile1}
        exec 8> ${tempfile2}

        echo "Sending data to the temp directory ${tempdir}"
        echo "This is a test line of data for ${tempfile1}">&7
        echo "This is a test line of data for ${tempfile2}">&8



#=======================================================================================================================
# 15.8 记录消息
    #!/bin/bash
    # by author:
    # description: tee命令相当于管道一个T型接头。从STDIN过来的数据同时发往两处。一处是 STDOUT，另一处是tee命令行所指定的文件名
    date | tee testfile

    # 想将数据追加到文件中，必须用-a选项
    date | tee -a testfile

#=======================================================================================================================
# 15.9 实例
