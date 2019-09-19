#!/usr/bin/env bash
# @File    :   12_structred_command.sh
# @Time    :   2019/9/18 12:30
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. if-then-else
if pwd
then
    echo "It worked"
fi
echo "We are outside the if statement"

testuser="ubuntu"
if grep ${testuser} /etc/passwd
then
    echo "This is my first command"
    echo "This is my second command"
    ls -a /home/${testuser}/.b*
fi

username="crisimple"
if grep ${username} /etc/passwd
then
    echo "This is my first command"
    echo "This is my second command"
else
    echo "The user [${username}] does not exits on this system."
    echo
fi

# ================================================================================
# 2. if嵌套
username_if="testuser"
if grep ${username} /etc/passwd
then
    echo "The user ${username_if} exists on this system."
else
    echo "The user ${username_if} dose not on this system."
    if ls -d /home/${username_if}/
    then
        echo "However, ${username_if} has a directory."
        echo `ls -a /home/${username_if}/`
    fi
fi


# ================================================================================
# 3. test命令
#   如果test命令中列出的条件成立，test命令就会退出并返回退出状态码0。
#   如果条件不成立，test命令就会退出并返回非零的退出状态码，这使得if-then语句不会再被执行。
var_test1="A"
if test ${var_test1}
then
    echo "The ${var_test1} expression return a True"
else
    echo "The ${var_test1} expression return a False"
fi

if test
then
    echo "The null  expression return a True"
else
    echo "The null expression return a False"
fi

var_test2="B"
if test ${var_test1} \> ${var_test2}
then
    echo "${var_test1} is bigger than ${var_test2}"
else
    echo "${var_test1} is litter than ${var_test2}"
fi
# 3.1 数字比较
#   数值比较功能
#       n1 -eq n2 检查n1是否与n2相等
#       n1 -ge n2 检查n1是否大于或等于n2
#       n1 -gt n2 检查n1是否大于n2
#       n1 -le n2 检查n1是否小于或等于n2
#       n1 -lt n2 检查n1是否小于n2
#       n1 -ne n2 检查n1是否不等于n2
var311=5
var312=6
if [[ ${var311} -eq ${var312} ]]
then
    echo "${var311} is equal ${var312}"
elif [[ ${var311} -gt ${var312} ]]
then
    echo "${var311} is bigger ${var312}"
else
    echo "${var311} is smaller ${var312}"
fi
# ------------------------------------------------------------------------------
# 3.2 字符串比较
#       str1 = str2 检查str1是否和str2相同
#       str1 != str2 检查str1是否和str2不同
#       str1 < str2 检查str1是否比str2小
#       str1 > str2 检查str1是否比str2大
#       -n str1 检查str1的长度是否非0
#       -z str1 检查str1的长度是否为0
username="ubuntu"
if [[ ${USER} = ${username} ]]
then
    echo "Welcome ${username}"
fi
# ------------------------------------------------------------------------------
# 3.3 文件比较
#       -d file 检查file是否存在并是一个目录
#       -e file 检查file是否存在
#       -f file 检查file是否存在并是一个文件
#       -r file 检查file是否存在并可读
#       -s file 检查file是否存在并非空
#       -w file 检查file是否存在并可写
#       -x file 检查file是否存在并可执行
#       -O file 检查file是否存在并属当前用户所有
#       -G file 检查file是否存在并且默认组与当前用户相同
#       file1 -nt file2 检查file1是否比file2新
#       file1 -ot file2 检查file1是否比file2旧
user_home="/home/ubuntu"
if [[ -d ${user_home} ]]
then
    echo "The ${user_home} directory exists"
    cd ${user_home}
    ls
else
    echo "The ${user_home} directory does not exists"
fi

location=$HOME
file_of_location="bash"
if [[ -e ${location} ]]
then
    echo "The ${location} is exists"
    echo "Now checking on the file, ${file_of_location}"
    if [[ -e ${file_of_location} ]]
    then
        echo "Ok on the file"
        echo "Updating the date..."
        date >> "../tests/file.log"
    else
        echo "File is not exists"
        echo "Nothing to update"
    fi
fi

# ================================================================================
# 4.复合条件测试
#    [ condition1 ] && [ condition2 ]
#    [ condition1 ] || [ condition2 ]
if [[ -d ${HOME} ]] && [[ -d bash ]]
then
    echo "****Two file is exists*****"
else
    echo "=====Not both are exists====="
fi

if [[ -d ${HOME} ]] || [[ -d bashs ]]
then
    echo "****have file is exists*****"
else
    echo "=====Not file is exists====="
fi

# ================================================================================
# 5.高级特性
#   双括号 --- 里面可以是任意的数学赋值或比较表达式
#       val++ 后增
#       val-- 后减
#       ++val 先增
#       --val 先减
#       ! 逻辑求反
#       ~ 位求反
#       ** 幂运算
#       << 左位移
#       >> 右位移
#       & 位布尔和
#       | 位布尔或
#       && 逻辑和
#       || 逻辑或
var51=10
if (( ${var51} ** 2 > 20 ))
then
    (( var511 = ${var51} ** 3 ))
    echo "The three square is ${var511}"
fi
#   双方括号 --- 双方括号命令提供了针对字符串比较的高级特性
if [[ ${USER} == u* ]]
then
    echo "Hello ${USER}"
else
    echo "byebye le nin lei"
fi


# ================================================================================
# 6. case命令
#   case命令会采用列表格式来检查单个变量的多个值。
case ${USER} in
ubuntu)
    echo "Hello ${USER}";;
test)
    echo "Hello test";;
1 | 2)
    echo "what";;
*)
    echo "Sorry";;
esac



# ================================================================================
# 7. for命令
#       允许你创建一个遍历一系列值的循环。每次迭代都使用其中一个值来执行已定义好的一组命令
#       在do和done语句之间输入的命令可以是一条或多条标准的bash shell命令
# 7.1 读取列表中的值
for test in A B C d e f
do
    echo "The test is ${test}"
done
# --------------------------------------------------------------------------------------------
# 7.2 读取列表中的复杂值
for test in I don\'t  this will work
do
    echo "word: ${test}"
done
# --------------------------------------------------------------------------------------------
# 7.3 从变量读取列表
lists="A B C Obama love Trump"
for test in ${lists}
do
    echo "test is ${test}"
done
# --------------------------------------------------------------------------------------------
# 7.4 从命令读取值
for test in $(echo ${PATH})
do
    echo "The path is ${test}"
done
# --------------------------------------------------------------------------------------------
# 7.5 更改字段分隔符
#   bash会将以下字符当作分隔符处理
#        空格
#        制表符
#        换行符
IFS=$'\n':@;   # 修改换行符为分隔符，只是临时的修改，出了这个环境其他依然使用默认的分隔符
file="states"
IFS=$'\n'
for state in $(cat ${file})
do
 echo "Visit beautiful $state"
done
# --------------------------------------------------------------------------------------------
# 7.6 用通配符读取目录 *
for file in /home/ubuntu/* /home/ubuntu/crisimple/
do
    if [[ -d ${file} ]]
    then
        echo "${file} is a directory"
    elif [[ -f ${file} ]]
    then
        echo "${file} is a file"
    else
        echo "sorry"
    fi
done


# ================================================================================
# 8. while命令


# ================================================================================
# 9. until命令


# ================================================================================
# 10. 循环嵌套


# ================================================================================
# 11. 控制循环


# ================================================================================
# 12. 实例
