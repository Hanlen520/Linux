#!/bin/bash
# by author: jwx522469
# description: 第十一章 处理用户输入

# 14.1 命令行参数
# 14.1.1 读取参数
# factorail
factorail=1
for (( number = 1; number <= $1; number++ ))
do
    factorail=$[ ${factorail} * $number ]
done
echo The factorail of $1 is ${factorail}

# parameter calculate
total=$[ $1 * $2 ]
echo The first parameter is $1
echo The second parameter is $2
echo The total value is ${total}

# 14.1.2 读取程序名---$0，写有多个功能的工具时很方便
#/bin/bash
# by author:
# description: testing the $0 parameter

echo the name of program is $0

# 注意：以上当执行程序./get_program_name.sh时，它的输出为the name of program is ./get_program_name.sh，这就存在一个问题
#       其实它不是真正的名字，接下来就引出basename
#/bin/bash
# by author:
# description: testing the basename $0 parameter
truename=`basename $0`
echo the true name of this program is ${truename}

# 14.1.3 测试参数
if [ -n $1 ];then
    echo "Hello $1"
else
    echo "Sorry"
fi

# ======================================================================================================================
# 14.2 特殊参数变量
# 14.2.1 参数计数---$#特殊脚本含有脚本运行时就有的命令行参数的个数
#/bin/bash
# by author:
# description: the parameter of command is: $#
echo There were $# parameters supplied.
truename=$(basename $0)
if [ $# -ne 2 ];then
    echo Usage: ${truename} a b
else
    total=$[ $1 + $2 ]
    echo The total is ${total}
fi

#/bin/bash
# by author:
# description: the last parameter is ${!#}
params=$#
echo "The last parameter is ${params}"
#echo The last parameter is ${!#}

#14.2 抓取所有数据---$* 把所有参数视为一个单词处理，不是将多个参数视为多个对象，而是将他们看作为一个参数
#                ---$@ 把所有参数作为同一个字符串中的多个单词处理，允许你遍历所有的值，将提供的每个参数分割开来
#!/bin/bash
        # by author:
# description: testing &* and $@
echo "Using the \$* method: $*"
echo "Using the \$@ method: $@"

count=1
for param in "$*"
do
    echo "\S* Parameter #${count} = ${param}"
    count=$[ $count + 1 ]
done

count=1
for param in "$@"
do
    echo "\$@ Parameter #${count} = ${param}"
    count=$[ $count + 1 ]
done

# ======================================================================================================================
# 14.3 移动变量--shift会根据它们的相对位置来移动命令行参数
#!/bin/bash
     # by author:
# description: shift，默认情况下它会将每个参数变量减一，当第一个参数被移除后，它的值会被丢掉且无法恢复
count=1
while [ -n "$1" ]
do
    echo "Parameter #${count} = $1"
    count=$[ $count + 1 ]
    shift
done
echo "$*"

#!/bin/bash
    # by author:
# description: shift提供一个参数来执行多位移动
echo "The original parameter is: $*"
shift 2
echo "Here is the new first parameter is：$1"



# ======================================================================================================================
# 14.4 处理选项

# 14.4.1 查找选项
# 1.处理简单选项
#!/bin/bash
        # by author:
# description: 处理简单选项
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found -a option";;
        -b) echo "Found -b option";;
        -c) echo "Found -c option";;
        *) echo "Sorry $1 option is not found, please check it"
    esac
    shift
done

# 2 分离参数和选项
#!/bin/bash
            # by author:
# description: 分离选项和参数
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found -a option";;
        -b) echo "Found -b option";;
        -c) echo "Found -c option";;
        --) shift
        break;;
    esac
done

count=1
for param in $@
do
    echo "Parameter #${count}: $param"
    count=$[ ${count} + 1 ]
done


# 3 处理带值的选项
#!/bin/bash
            # by author:
# description: 处理带值的选项
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Found the -a option";;
        -b) param="$2"
        echo "Found the -b option, with parameter value is ${param}"
        shift 2;;
        -c) echo "Found the -c option";;
        --) shift
        break;;
        *) echo "$1 not an option";;
    esac
    shift
done

count=1
for param in $@
do
    echo "Parameter #${count}: $param"
    count=$[ ${count} + 1 ]
done


# 14.4.2 使用getopt命令---针对上方的不足，使用更加友好的交互方式；在后面加-q会忽略掉自有的一条错误信息
# 1.在命令的格式
getopt options optstring parameters
getopt ab:cd -a -b test1 -cd test2 test3

# 2.在脚本中使用getopt-- set显示所有的系统环境变量
#!/bin/bash
            # by author:
# description: extracting command line options and values with getopt
set -- `getopt -q ab:c "$@"`
while [ -n $1 ]
do
    case "$1" in
        -a) echo "Found the -a option ";;
        -b) param="$2"
        echo "Found the -b option, with parameter value ${param}";;
        -c) echo "Found the -c option";;
        --) shift
        break;;
        *) echo "$1 not an option";;
    esac
    shift
done

count=1
for param in "$@"
do
    echo "Parameter #$count: $param"
    count=$[ $count + 1 ]
done

# 3.使用更高级的getopts
# 命令格式：getopts optstring variable

# ======================================================================================================================
# 14.5 将选项标准化
# 通用的Linux命令选项
# -a 显示所有对象        -c 生成一个计数         -d 指定一个目录                    -e 扩展一个对象
# -f 指定读入数据的文件   -h 显示命令的帮助信息   -o 指定将所有输出重定向到的输出文件   -q 以安静模式运行
# -i 忽略文本的大小写    -l 产生输出的长格式版本  -n 使用非交互模式（批量）            -r 递归地处理目录和文件
# -s 以安静模式运行      -v 生成详细输出         -x 排除某个对象                     -y 对所有问题回答yes

# ======================================================================================================================
# 14.6 获得用户输入
# 14.6.1 基本的读取--read接收从标准输入（键盘）或另一个文件描述符的输入
#!/bin/bash
        # by author:
# description: testing the read command
echo -n "Enter your name: " # -n移除字符串末尾的换行符
read name
echo "Hello ${name}, welcome to my program."

#!/bin/bash
        # by author:
# description: testing the read -p command
read -p "please enter your age: " age
days=$[ $age * 365 ]
echo "That makes you over ${days} days old"

read -p "Enter your name: " first last
echo "Check name for: $last $first"

read -p "Enter a number: "
factorial=1
for (( count=1; count<$REPLY; count++ ))
do
    factorial=$[ $factorail * $count ]
done
echo "The factorial of $REPLY is ${factorail}"

# 14.6.2 超时-- -t来指定一个定时器，计时器过期后，read命令返回一个非0退出状态码
#!/bin/bash
        # by author:
# timing the data enter
if read -t 5 -p "please enter your name: " name;then
    echo "Hello $name, Welcome to my script"
else
    echo
    echo "Sorry, you are so slow"
fi

# 使用read对输入的字符做计数统计，达到预设的字符个数时退出
read -nl -p "Do you want to continue [Y/N]?" answer
case ${answer} in
    Y | y) echo
    echo "Fine, continue on...";;
    N | n) echo
    echo "Ok, goodbye."
exit;;
esac
echo "This end of the script"

# 14.6.3 隐藏方式读取
#!/bin/bash
        # by author
# description: hiding input  data from the monitor
read -s -p "Enter your password: " pass
echo
echo "Is your password really $pass"


# 14.6.4 从文件中读取
#!/bin/bash
        # by author:
# description: reading data from a file
count=1
cat test | while read line
do
    echo "Line $count: $line"
    count=$[ $count + 1 ]
done
echo "Finished processing the file"

# another script style
count=1
while read line
do
    echo "Line $count: $line"
    count=$[ $count + 1 ]
done < filename.txt


