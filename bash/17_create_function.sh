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

