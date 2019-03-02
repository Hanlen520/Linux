#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第十七章 创建函数----为了解决重复使用同一段代码的弊端

#=======================================================================================================================
# 17.1 基本的脚本函数
    # 17.1.1 创建函数
        function name {
            commands
        }

        name() {
            commands
        }
    # 17.1.2 使用函数----要在脚本中使用函数，只需要像其他shell命令一样，在行中指定函数名就行了
        #!/bin/bash
        # by author: Crisimple
        # description: using a function in a script
        # 如果在函数被定义前使用 函数，你会收到一条错误消息
        # ，函数名必须是唯一的，重定义了函数， 新定义会覆盖原来函数的定义，这一切不会产生任何错误消息。
        function echoWords {
            echo "This is an example of a function."
        }

        count=1
        while [ ${count} -le 5 ]
        do
            echoWords
            count=$[ ${count} + 1 ]
        done
        #
        echo "This is end of the loop..."
        echoWords
        echo "This is end of the script."


#=======================================================================================================================
# 17.2 返回值
    # 17.2.1 默认退出状态码
        # 在函数执行结束后，可以用标准变量$?来确定函数的退出状态码
            #!/bin/bash
            # by author:
            # description: testing the exit status of a function; function_exit_status.sh
            functionOne() {
                echo "trying to display a non-existent file"
                ls -l badfile       //这是一条错误的命令,所以在执行完成后退出的状态码会是1,调换两个两个位置的话会是0
            }
            echo "testing the function: "
                functionOne
            echo "The exit status is : $?"

        ./function_exit_status.sh


    # 17.2.2 使用return命令---bash shell使用return命令来退出函数并返回特定的退出状态码，return命令允许指定一个 整数值来定义函数的退出状态码
        #!/bin/bash
        # by author: Crisimple
        # description: use a return command in a function; return_new_status.sh
        # attention: 函数一结束就取返回值； 退出状态码必须是0~255,任何大于256的值都会产生一个错误值。
        function returnStatus {
            read -p "Enter a value:" value
            echo "doubling a value"
            return $[ ${value} * 2 ]
        }
        returnStatus
        echo "The new value is the exit status is: $?"

        ./return_new_status.sh

    # 17.2.3 使用函数输出---对函数的输出保存到一个变量里去
        #!/bin/bash
        # by author: Crisimple
        # description: function output to a variable; function_output_value.sh
        function functionOut{
            read -p "Enter a value: " value
            return $[ ${value} * 3 ]
        }
        result=$(functionOut)
        echo "The function output new value is: ${result}"

        ./function_output_value.sh


# ======================================================================================================================
# 17.3 在函数中使用变量
    # 17.3.1 向函数传递参数
        #!/bin/bash
        # by author: Crisimple
        # description: 在脚本中指定函数时，必须将参数和函数放在同一行；函数首先会检查脚本传给它的参数数目。
        function addem{
            if [ $# -eq 0 ] || [ $# -ge 2 ];then
                echo -1
            elif [ $# -eq 1 ];then
                echo $[ $1 + $1 ]
            else
                echo $[ $1 + $2 ]
            fi
        }

        echo -n "Adding 10 and 15:"
        value=$(addem 10 15)
            echo ${value}
        echo -n "Let's try adding just one number:"
        value=$(addem 10)
            echo ${value}
        echo -n "Let's try adding no number: "
        value=$(addem)
            echo ${value}
        echo -n "Let's try adding three number: "
        value=$(addem 10 15 20)
            echo ${value}

        # 要在函数中 使用这些值，必须在调用函数时手动将它们传过去
        function transmitParameter {
            echo $[ $1 * $2 ]
        }

        if [ $# -eq 2 ];then
            value=$(transmit $1 $2)
            echo "The result is ${value}"
        else
            echo "Usage: badTest a b"


    # 17.3.2 在函数中处理变量
        # 1. 全局变量---是在shell脚本中任何地方都有效的变量，默认情况下在函数中定义的变量为全局变量，即在函数的外部定义的。
            #!/bin/bash
            # by author:Crisimple
            # description: use variable in function
            returnDouble(){
                value=$[ ${value} * 2 ]
            }
            read -p "Enter your value: " value
            returnDouble
            echo "The new value is: " ${value}


        # 2.局部变量---无需在函数中使用全局变量，函数内部使用的任何变量都可以被声明成局部变量。
            #!/bin/bash
            # by author: Crisimple
            # description: use local identify local variable
            localVariable(){
                local temp=$[ ${value} + 5 ]
                result=$[ ${temp} * 2 ]
            }
            temp=4
            value=6
            localVariable
            echo "The result is ${result}"
            if [ ${temp} -gt ${value} ];then
                echo "temp is larger"
            else
                echo "temp is smaller"
            fi


# ======================================================================================================================
# 17.4 数组变量和函数
    # 17.4.1 向函数传数组参数
        #!/bin/bash
        # by author: Crisimple
        # description: trying to pass an array variable; transmit_array.sh

        # 如果你试图将该数组变量作为函数参数，函数只会取数组变量的第一个值
        transmitArray() {
            echo "The parameter are: $@"
            thisArray=$1
            echo "The received array ${thisArray[*]}"
        }

        myArray=(1 2 3 4 5)
        echo "The original array is : ${thisArray[*]}"
        transmitArray $myArray

        # 在函数内部，可以将所有的参数重新组合成一个新的变量
        function transmitArrayTwo {
            local newArray
            newArray=(;`echo ""$@"`)
            echo  "The new array value is: ${newArray[*]}"
        }
        myArrayTwo=(1 2 3 4 5)
        echo "The original array is ${newArray[*]}"
        transmitArrayTwo $myArrayTwo

        # 在函数内部，数组仍然可以像其他数组一样使用
        addArray() {
            local sum=0
            local newArray
            newArray=($(echo "$@"))
            for value in ${newArray[*]}
            do
                sum=$[ $sum + $value ]
            done
            echo $sum
        }
        myArrayThree=(1 2 3 4 5)
        echo "The original array is: ${myArrayThree[*]}"
        arg1=$(echo ${myArrayThree[*]})
        result=$(addArray $arg1)
        echo "The result is $result"

        ./transmit_array.sh

    # 17.4.2 从函数返回数组---函数用echo语句来按正确顺序输出单个数组值，然后脚本再将它们重新放进一个新的数组变量中。
        #!/bin/bash
        # by author: Crisimple
        # description: returning an array value
        returnArray(){
            local originalArray
            local newArray
            local elements
            local i
            originalArray=($(echo "$@"))
            newArray=($(echo "$@"))
            elements=$[ $# - 1 ]
            for(( i = 0; i <= $elements; i++ ))
            do
                newArray[$i]=$[ ${originalArray[$i]} * 2]
            done
            echo ${newArray[i]}
        }
        myArray=(1 2 3 4 5)
        echo "The original array is: ${myArray[*]}"
        arg1=$(echo ${myArray[*]})
        result=($(returnArray $arg1))
        echo "The new array is: ${result[*]}"



# ======================================================================================================================
# 17.5 函数递归---局部函数变量的一个特性是自成体系，自成体系的函数不 需要使用任何外部资源
    #!/bin/bash
    # by author: Crisimple
    # description: using recursion; factorial.sh
    function factorial{
        if [ $1 -eq 1 ]；then
            echo 1
        else
            local temp=$[ $# -1 ]
            local result=${ factorial ${temp} }
            echo $[ $result * $1 ]
        fi
    }

    read -p "Please enter one number: " value
    result==$(factorial $value)
    echo "The factorial of $value is: $result"

    ./factorial.sh


# ======================================================================================================================
# 17.6 创建库---bash shell允许创建函数库文件，然后在多个脚本中引用该库文件
    # 第一步是创建一个包含脚本中所需函数的公用库文件。like below
        #/bin/bash
        # cat myFuncs---库文件名
        # my script functions
        function addem{
            echo $[ $1 + $2 ]
        }
        function multem{
            echo $[ $1 * $2 ]
        }
        function divem{
            if[ $2 -ne 0 ];then
                echo $[ $1 / $2 ]
            else
                echo -1
            fi
        }

    # 二使用函数库的关键在于source(作点操作符(dot operator))命令；用source命令来在shell脚本中运行库文件脚本，使用相应路径访问该文件
        #!/bin/bash
        # by author: Crisimple
        # description: use functions defined in another script
        ../myFuncs  # 或者 source ./myFuncs
        valueOne=10
        valueTwo=20
        resultAddem=$( addem ${valueOne} ${valueTwo} )
        echo "The result of adding them is: ${resultAddem}"



# ======================================================================================================================
# 17.7 在命令行上使用函数
    # 17.7.1 在命令行上创建函数---当在命令行上定义函数时，你必须记得在每个命令后面加个分号
        # function divem { echo $[ $1 / $2 ];  }
        # divem 100 5


    # 17.7.2 在.bashrc文件中定义函数---在命令行上直接定义shell函数的明显缺点是退出shell时，函数就消失了
        # 1. 直接定义函数---写的函数放在文件末尾就行了
        # 2. 读取函数文件---可以用source命令（或者它的别名点操作符）将库文件中的函数 添加到你的.bashrc脚本中



# ======================================================================================================================
#  17.8 实例
    # 17.8.1 下载及安装
    # 17.8.2 构建库---shtool文件必须针对特定的Linux环境进行配置。配置工作必须使用标准的configure和make命令
    # 17.8.3 shtool库函数
    # 17.8.4 使用库












