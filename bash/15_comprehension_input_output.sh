#!/usr/bin/env bash
# @File    :   15_comprehension_input_output.sh
# @Time    :   2019/9/20 0:14
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. 理解输入输出
#        在显示器屏幕上显示输出
#        将输出重定向到文件中
#        时将一部分数据在显示器上显示，另一部分数据保存到文件中也是不错的
# 1.1 标准文件描述符
#       文件描述符是一个非负整数，可以唯一标识会话中打开的文件。每个进程一次最多可以有九个文件描述符
#       0 STDIN  标准输入
cat                 # 直接在屏幕上标准输入
cat < testfile      # STDIN重定向符号强制cat命令接受来自另一个非STDIN文件的输入
#       1 STDOUT 标准输出
ls -l > test2
cat test2
who test2
#       2 STDERR 标准错误
#           STDERR文件描述符代表shell的标准错误输出。shell或shell中运行的程序和脚本出错时生成的错误消息都会发送到这个位置
#       三个特殊文件描述符会处理脚本的输入和输出
# 1.2 重定向错误
#   test*的文件是代表存在的，badtest代表文件是不存在的
ls -al badfile 2> test4
ls -al test test2 test3 badtest 2> test6 1> test7
#   也可以将STDERR和STDOUT的输出重定向到同一个输出文件。为此bash shell提供了特殊的重定向符号&>。
ls -al test test2 test3 badtest &> test7


# =============================================================================================
# 2. 在脚本中重定向输出
#   2.1 临时重定向行输出
cat test21
#!/bin/bash
# testing STDERR messages
echo "This is an error" >&2
echo "This is normal output"
./test21 2> test_stderr.log
cat test_stderr.log
This is an error
#   2.2 永久重定向脚本中的所有命令
#       如果脚本中有大量数据需要重定向，那重定向每个echo语句就会很烦琐
#       用exec命令告诉shell在脚本执行期间重定向某个特定文件描述符
#       一旦重定向了STDOUT或STDERR，就很难再将它们重定向回原来的位置
exec 2>testerror
echo "This is the start of the script"                  # 屏幕输出
echo "now redirecting all output to another location"   # 屏幕输出
exec 1>testout
echo "This output should go to the testout file"        # 重定向输出到 testout 文件中
echo "but this should go to the testerror file" >&2     # 重定向到 testerror 文件中


# =============================================================================================
# 3. 在脚本中重定向输入
#   可以使用与脚本中重定向STDOUT和STDERR相同的方法来将STDIN从键盘重定向到其他位置
exec 0< file
count=1
while read line
do
    echo "Line #$count: $line"
    count=$[ $count + 1 ]
done


# =============================================================================================
# 4. 创建自己的重定向
#   在shell中最多可以有9个打开的文件描述符。其他6个从3~8的文件描述符均可用作输入或输出重定向。
#   可以将这些文件描述符中的任意一个分配给文件，然后在脚本中使用它们。
#   可以用exec命令来给输出分配文件描述符。
# 4.1 创建输出文件描述符
$ cat test13
#!/bin/bash
# using an alternative file descriptor
exec 3>test13out
#exec 3>>test13out  或者可以不用创建新的文件，重定向到现有的文件中去
echo "This should display on the monitor"
echo "and this should be stored in the file" >&3
echo "Then this should be back on the monitor"
$ cat test13
$ and this should be stored in the file
# ---------------------------------------------------------------------------------------------
# 4.2 重定向文件描述符
#   怎么恢复已重定向的文件描述符。你可以分配另外一个文件描述符给标准文件描述符
#   意味着你可以将STDOUT的原来位置重定向到另一个文件描述符，然后再利用该文件描述符重定向回STDOUT
$ cat test42
#!/bin/bash
exec 3>&1           # 先将3描述符指向1描述符的位置，也就是STDOUT（屏幕输出）
exec 1>test42out    # 将描述符1指向文件输出，但是3依然指向的是STDOUT的位置不变
echo "A to test42out"
echo "b to test42out"
exec 1>&3           # 将描述符1指向描述符3 STDOUT的位置；也就是说3相当于是等价替换中的一个变量
echo "Now C back to appear on screen."
$ ./test42
$ Now C back to appear on screen.
$ cat test42out
$ "A to test42out"
$ "b to test42out"
# ---------------------------------------------------------------------------------------------
# 4.3 创建输入文件描述符
#   先将STDIN文件描述符保存到另外一个文件描述符，然后在读取完文件之后再将STDIN恢复到它原来的位置
$ cat test43
#!/bin/bash
exec 9<&0
exec 0<test43input
num=1
while read line
do
    echo
    echo "line #${num}: ${line}"
    num=$[ ${num} + 1 ]
done
exec 0<&9
read -p "Do you want to continue [y|n]?": answer
case ${answer} in
    y|Y) echo
         echo "WELCOME";;
    n|N) echo
         echo "GOODBYE";;
    *) echo
       echo "CHECK YOUR ANSWER";;
esac
$ ./test43.sh
$ Line #1: This is the first line.
$ Line #2: This is the second line.
$ Line #3: This is the third line.
$ "Do you want to continue [y|n]? " y
$ WELCOME
$
# ---------------------------------------------------------------------------------------------
# 4.4 创建读写文件描述符
#   也可以打开单个文件描述符来作为输入和输出
#   用一个文件描述符对同一个文件进行读写
$ cat testfile44
$ "This is the first line"
$ "This is the second line"
$ "This is the third line"
#!/bin/bash
exec 3<>testfile44
read line<&3
echo "Read: ${line}"
echo "*****This is a test line******" >&3
$ ./test44
$ "Read: This is the first line"
$ cat testfile44
$ "This is the first line"
$ "*****This is a test line******"
$ "This is the third line"
# ---------------------------------------------------------------------------------------------
# 4.5 关闭文件描述符
#   创建了新的输入或输出文件描述符，shell会在脚本退出时自动关闭它们。
#   有情况下，你需要在脚本结束前手动关闭文件描述符。
#   要关闭文件描述符，将它重定向到特殊符号&-。
#   一旦关闭了文件描述符，就不能在脚本中向它写入任何数据，否则shell会生成错误消息。
$ cat test17
#!/bin/bash
# testing closing file descriptors
exec 3> test17file
echo "This is a test line of data" >&3
exec 3>&-
cat test17file
exec 3> test17file
echo "This'll be bad" >&3
$ ./test17
$ "This is a test line of data"
$ cat test17file
$ "This'll be bad"


# ==================================================================================
# 5. 列出打开的文件描述符
#   lsof命令会列出整个Linux系统打开的所有文件描述符
#       -p 指定进程ID（PID）
#       -d 后者允许指定要显示的文件描述符编号
#       特殊环境变量$$  进程的当前PID，shell会将它设为当前PID
#       -a选项用来对其他两个选项的结果执行布尔AND运算
#       当前进程（bash shell）的默认文件描述符（0、1和2）。
#   lsof的默认输出
#       COMMAND 正在运行的命令名的前9个字符
#       PID 进程的PID
#       USER 进程属主的登录名
#       FD 文件描述符号以及访问类型（r代表读，w代表写，u代表读写）
#       TYPE 文件的类型（CHR代表字符型，BLK代表块型，DIR代表目录，REG代表常规文件）
#       DEVICE 设备的设备号（主设备号和从设备号）
#       SIZE 如果有的话，表示文件的大小
#       NODE 本地文件的节点号
#       NAME 文件名
which lsof


# ==================================================================================
# 6. 阻止命令输出
#   将STDERR重定向到一个叫作null文件的特殊文件;null文件的标准位置是/dev/null。你重定向到该位置的任何数据都会被丢掉，不会显示。
#   同时由于/dev/null为空，可以将其作为输入文件，从而快速清除像有文件中的数据，而不用先删除文件再重新创建
cat /dev/null > test_null.txt


# ==================================================================================
# 7.创建临时文件
#       使用/tmp目录来存放不需要永久保留的文件
#       大多数Linux发行版配置了系统在启动时自动删除/tmp目录的所有文件。
#       mktemp命令可以在/tmp目录中创建一个唯一的临时文件
# 7.1 创建本地临时文件
mktemp testing.XXXXXX       # mktemp命令会用6个字符码替换这6个X，从而保证文件名在目录中是唯一的
$ cat file71.sh
#!/bin/bash
# creating and using a temp file
tempfile=$( mktemp testing.XXXXXX )
exec 3>${tempfile}
echo "This script writes to temp file ${tempfile}"
echo "This is the first line" >&3
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&-
echo "Done creating temp file. The contents are:"
cat ${tempfile}
rm -f ${tempfile} 2> /dev/null
# 7.2 在/tmp目录中创建临时文件
#   -t选项会强制mktemp命令来在系统的临时目录来创建该文件，不管里当前处在那个位置都可以在/tmp/中生成临时文件
# 7.3 创建临时目录
#   -d选项告诉mktemp命令来创建一个临时目录而不是临时文件
$ cat test21
#!/bin/bash
# using a temporary directory
tempdir=$(mktemp -d dir.XXXXXX)
cd ${tempdir}
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7> ${tempfile1}
exec 8> ${tempfile2}
echo "Sending data to directory ${tempdir}"
echo "This is a test line of data for ${tempfile1}" >&7
echo "This is a test line of data for ${tempfile2}" >&8


# ==================================================================================
# 8. 记录消息
#   tee  ---  将输出同时发送到控制台和日志文件
#             tee命令相当于管道的一个T型接头。它将从STDIN过来的数据同时发往两处。
#             一处是STDOUT，另一处是tee命令行所指定的文件名
date | tee test_date_file.txt
#       想将数据追加到文件中，必须用-a选项
date | tee -a test_date_file.txt



# 9. 实例
# 需求：
#       可以把数据库数据放入电子表格中
#       把电子表格保存成.csv格式，
#       读取文件，
#       然后创建INSERT语句
#       将数据插入MySQL数据库
$ cat test159.sh
#!/bin/bash
# read file and create INSERT statements for MySQL
outfile='members.sql'
IFS=','
while read lname fname address city state zip
do
    cat >> ${outfile} << EOF
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES
    ('${lname}', '${fname}', '${address}', '${city}', '${state}', '${zip}');
    EOF
done < ${1}

$ ./test23 < members.csv
