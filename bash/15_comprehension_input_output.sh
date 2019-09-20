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
# ---------------------------------------------------------------------------------------------
# 4.5 关闭文件描述符
