#!/usr/bin/env bash
# @File    :   14_process_user_input.sh
# @Time    :   2019/9/19 20:55
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None

# 1. 命令行参数
#   bash shell提供了一些不同的方法来从用户处获得数据，包括命令行参数（添加在命令后的数据）、
#   命令行选项（可修改命令行为的单个字母）以及直接从键盘读取输入的能力。
#   位置参数变量是标准的数字：$0是程序名，$1是第一个参数，$2是第二个参数，依次类推，直到第九个参数$9。
var141=1
for (( number=1; number<=$1; number++ ))
do
    var141=$[ ${var141} * ${number} ]
done
echo "$1 的阶乘为: ${var141}"

var142=1
number=1
while (( ${number}<=$1 ))
do
#    number=$[ ${number} + 1 ]
    var142=$[ ${var142} * ${number} ]
    number=$[ ${number} + 1 ]
done
echo "$1 ....: ${var142}"

echo "$1 + $2 的和为 $[ $1 + $2 ]"
echo "执行脚本的名称+路径是：$0"
name=$(basename $0)
echo "脚本的名称：${name}"

if [[ -n $1 ]]
then
    echo "Hello $1"
else
    echo "Please check your parameter"
fi


# ==================================================================================
# 2. 特殊参数变量
#   参数统计 --- 特殊变量$#含有脚本运行时携带的命令行参数的个数
echo "There were $# parameters input"
if [[ $# -ne 2 ]]
then
    echo "$(basename $0) must have two parameters"
else
    echo $[$1 * $2]
fi
#   ${$#}就代表了最后一个命令行参数变量
#       意味着不传参数的话返回的就是执行脚本的名称
echo "************* ${!#} **************"
# -----------------------------------------------------------------------------------
#   抓取所有的数据
#       $*变量会将命令行上提供的所有参数当作一个单词保存，将这些参数视为一个整体，而不是多个个体。
#       $@变量会将命令行上提供的所有参数当作同一字符串中的多个独立的单词
for param in $*
do
    echo "\$* parameter #$count=$param"
    echo $*
    count=$[ $count + 1]
done
echo ".........."

for param in $@
do
    echo "\$@ parameter #$count=$param"
    echo $@
    count=$[ $count + 1]
done


# ==================================================================================
# 3. 移动变量
#   shift命令会根据它们的相对位置来移动命令行参数，下它会将每个参数变量向左移动一个位置
#   注意，变量$0的值，也就是程序名，不会改变
#   后面加参数就可以移动多个位置了
echo "33333333333 shift parameter 3333333333333333"
count=1
while [[ -n $1 ]]
do
    echo "parameter is #${count} = $1"
    count=$[ ${count} + 1 ]
    shift 2
done


# ==================================================================================
# 4. 处理选选项
#   4.1 查找选项
echo "414141414141 "
while [[ -n "$1" ]]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) echo "Found the -b option";;
        -c) echo "Found the -c option";;
        *) echo "The are no an option";;
    esac
    shift
done
# --------------------------------------------------------------------------------
#   4.2 分离参数和选项
#       shell会用双破折线来表明选项列表结束
#       在双破折线之后，脚本就可以放心地将剩下的命令行参数当作参数，而不是选项来处理了
echo
while [[ -n "$1" ]]
do
     case "$1" in
     -a) echo "Found the -a option" ;;
     -b) echo "Found the -b option";;
     -c) echo "Found the -c option" ;;
     --) shift
     break ;;
     *) echo "$1 is not an option";;
    esac
    shift
done
#
count=1
for param in $@
do
 echo "Parameter #$count: $param"
 count=$[ $count + 1 ]
done
#   使用 getopt 命令
#       能够识别命令行参数，从而在脚本中解析它们时更方便。
getopt ab:cd -a -b test1 -cd test2 test3
#   使用更高级的 getopts
#       而getopts命令能够和已有的shell参数变量配合默契


# ==================================================================================
# 5. 将选项标准化
#       -a  显示所有对象
#       -c  生成一个计数
#       -d  指定一个目录
#       -e  扩展一个对象
#       -f  指定读入数据的文件
#       -h  显示命令的帮助信息
#       -i  忽略文本大小写
#       -l  产生输出的长格式版本
#       -n  使用非交互模式（批处理）
#       -o  将所有输出重定向到的指定的输出文件
#       -q  以安静模式运行
#       -r  递归地处理目录和文件
#       -s  以安静模式运行
#       -v  生成详细输出
#       -x  排除某个对象
#       -y  对所有问题回答yes


# ==================================================================================
# 6. 活得用户的输入
#   6.1 基本的读取
echo -en "Enter your name: "
read name
echo "Hello ${name}, Welcome to my program."
read -p "Enter your age: " age
echo "you have got $[${age} * 365] "
read -p "Enter your job: "
echo "your job $REPLY look so cool."
# ----------------------------------------------------------------------------------
#   6.2 超时
#       用-t选项来指定一个计时器
if read -t 3 -p "Enter you sex: " sex
then
    echo "hi, you are ${sex}"
else
    echo "so slow"
fi
#   -n选项和值1一起使用，告诉read命令在接受单个字符后退出
read -n1 -p "Do you want to continue 【y | n】?" answer
case ${answer} in
    y | Y) echo
           echo  "Welcome to play more games";;
    n | N)echo
          echo "Goodbye"
          exit;
esac
echo "==END OF THE SCRIPTS=="
# ----------------------------------------------------------------------------------
# 6.3 隐藏方式读取
#   典型的例子就是输入的密码，但除此之外还有很多其他需要隐藏的数据类型
#   -s选项可以避免在read命令中输入的数据出现在显示器上
#   实际上，数据会被显示，只是read命令会将文本颜色设成跟背景色一样
read -s -p "Enter your password: " password
if [[ ${password} -eq "123" ]]
then
    echo
    echo "Welcome to system, the password is ${password}"
else
    echo "sorry, wrong password"
fi
# ----------------------------------------------------------------------------------
# 6.4 从文件中读取
#   每次调用read命令，它都会从文件中读取一行文本。当文件中再没有内容时，read命令会退出并返回非零退出状态码。
count=1
file="01_cat_system_info.sh"
cat ${file} | while read line
do
    echo "Line ${count}: ${line}"
    count=$[ ${count} + 1 ]
done
echo "read the file end......"
