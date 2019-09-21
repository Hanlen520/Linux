#!/usr/bin/env bash
# @File    :   17_create_function.sh
# @Time    :   2019/9/20 20:18
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None

# 1. 脚本函数
$ cat test171.sh
function echo_str{
    echo "This func to show string."
}
num=1
while [[ ${num} -le 5 ]]
do
    echo_str
    num=$[ ${num} + 1]
done
echo "This is the end of the loop"
func1
echo "Now this is the end of the script"
#
$ ./test171.sh


# ===========================================================================
# 2. 返回值
#   bash shell会把函数当作一个小型脚本，运行结束时会返回一个退出状态码
#       函数一结束就取返回值
#       退出状态码必须是0~255
$ cat test172.sh
#!/bin/bash
# bash shell函数的返回值
function return_code() {
    echo "trying to display a non-existent file"
    ls -al badfile
}
return_code
echo "The exit the status is: $?"
#
$ ./test172.sh
# 2.1 使用 return 命令
#!/bin/bash
function return_code() {
    read -p "Enter a value: " value
    echo ""
    return $[ ${value} * 2 ]
}
return_code
echo "The new return code is: $?"
# 2.2 使用函数输出
$ cat test172.sh
#!/bin/bash
function return_output() {
    read -p "Enter a value: " value
    value=$[ ${value} + 1 ]
    echo ${value}
}
result=$(return_output)
echo "The function result is: ${result}"


# ===========================================================================
# 3. 在函数中使用变量
# 3.1 向函数传递参数
$ cat test173.sh
#!/bin/bash
function add_para() {
    echo $[ $1 + $2 ]
}

if [[ $# -eq 2 ]]
then
    echo -n "your add_para result is: $(add_para $1 $2)"
else
    echo "add_para function must need two parameter"
fi
# 3.2 在函数中处理变量
#     全局变量 --- 在函数外被定义并被赋予值
#     局部变量 --- 在变量声明的前面加上local，函数内部使用的任何变量都可以被声明成局部变量
$ cat test173.sh
#!/bin/bash
function global_func() {
    value=$[ ${value} * 2 ]
}
read -p "Enter a value: " value
echo "Input value is: ${value}"
global_func
echo "The new value is: ${value}"
# $ Enter a value: 40
# $ Input value is: 40
# $ The new value is: 80
#
$ cat test173.sh
function local_func() {
    temp=$[ ${value} + 5 ]
    result=$[ ${temp} * 2 ]
}
temp=4
value=6
local_func
if [[ ${temp} -gt ${value} ]]
then
    echo "temp：${temp} is larger"
else
    echo "temp：${temp} is smaller"
fi
# ------------------
function local_func() {
    local temp=$[ ${value} + 5 ]
    result=$[ ${temp} * 2 ]
}
temp=4
value=6
local_func
if [[ ${temp} -gt ${value} ]]
then
    echo "temp：${temp} is larger"
else
    echo "temp：${temp} is smaller"
fi
$ ./test173.sh
#$ temp：4 is smaller



# ===========================================================================
# 4. 数组变量和函数--------乱七八糟的,,,,,心好乱
#   4.1 向函数传递数组参数
$ cat test174.sh
#!/bin/bash
function array_func() {
    echo "The array is $@"
    local newarray
    newarray=(; "echo '$@'")
    echo "The new array value is: ${newarray[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is ${myarray[*]}"
array_func ${myarray[*]}
#   4.2 从函数返回数组
#   用echo语句来按正确顺序输出单个数组值，然后脚本再将它们重新放进一个新的数组变量中。
$ cat test174.sh
#!/bin/bash
# returning an array value
function arraydblr {
 local origarray
 local newarray
 local elements
 local i
 origarray=($(echo "$@"))
 newarray=($(echo "$@"))
 elements=$[ $# - 1 ]
 for (( i = 0; i <= $elements; i++ ))
 {
 newarray[$i]=$[ ${origarray[$i]} * 2 ]
 }
 echo ${newarray[*]}
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})
result=($(arraydblr ${arg1}))
echo "The new array is: ${result[*]}"



# ===========================================================================
# 5. 函数递归
#   局部函数变量的特点是自成体系，除了从脚本命令行处获得变量，自成体系的函数不需要任何的外部资源
#   这个特性使得函数可以递归调用，也就是函数可以调用自己得到的结果
$ cat test175.sh
#!/bin/bash
function factorial() {
    if [[ $1 -eq 1 ]]
    then
        echo 1
    else
        local temp=$[ $1 - 1 ]
        local_result=`factorial ${temp}`
        echo $[ ${local_result} * $1 ]
    fi
}
read -p "Enter a value: " value
result=$(factorial ${value})
echo "The factorial result is ${result}"



# ===========================================================================
# 6.创建库
#   bash shell允许创建函数库文件，然后在多个脚本中引用该库文件。
$ cat myfuncs
# my script functions
function addem {
    echo $[ $1 + $2 ]
}
function multem {
    echo $[ $1 * $2 ]
}
function divem {
    if [[ $2 -ne 0 ]]
    then
        echo $[ $1 / $2 ]
    else
        echo -1
    fi
}
#   source myfuncs(或者 . ./myfuncs )  ---  像普通脚本文件那样运行库文件，函数并不会出现在脚本中。



# ===========================================================================
#  7. 在命令行中使用函数
#  7.1 在命令行中创建函数
$ function test_single_line_func { echo "采用单行方式定义函数"}
$ function test_mulit_lines_func{
    echo $[ $1 + $2 ]
}
$ test_mulit_lines_func 2 3
# ---------------------------------------------------------------------------
#  7.2 在.bashrc文件中定义函数
#   在命令行上直接定义shell函数的明显缺点是退出shell时，函数就消失了。
#   是.bashrc文件。bash shell在每次启动时都会在主目录下查找它，不管是交互式shell还是从现有shell中启动的新shell。
#   （1）直接在.bashrc文件中定义函数就行，其他不要动
#   （2）使用source命令读取你的库函数文件到.bashrc中

