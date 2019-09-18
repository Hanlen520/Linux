#!/usr/bin/env bash
# @File    :   11_build_basic_shell.sh
# @Time    :   2019/9/17 20:27
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. 使用多个命令
#   可以将它们放在同一行中，彼此间用分号隔开；命令长度最大不能超过255个字符
date; who; whoami


# ================================================================================
# 2. 创建 shell 脚本
# 执行脚本在脚本目录下输入：
#     sh 脚本文件名称.sh
#  或者
#     ./脚本文件名称.sh
# #!/usr/bin/env bash
echo $PATH;     # 打印环境变量


# ================================================================================
# 3. 显示消息
echo "打印显示消息"
echo "I'am a good student. I love python"
#   如果想把命令输出信息显示和字符串显示在一行时，可以加-n
echo "Now date is: "
date
echo " "
echo -n "Now date is: "
date


# ================================================================================
# 4. 使用变量
# 4.1 环境变量
#   可以用set命令来显示一份完整的当前环境变量列表
#   在环境变量名称之前加 $ 来使用环境变量
echo USER ID IS: $UID
echo "USER NAME IS: $USER"
echo USER HOME IS: $HOME
echo "The cost of the item is \$15"
# --------------------------------------------------------------------------------
# 4.2 用户变量
#   使用等号将值赋给用户变量，变量名称区分大小写，在变量、等号和值之间不能出现空格
#   变量的生命周期为：shell脚本中的定义的变量会一直保持着它的值，当在shell脚本结束时会被删除掉
my_variable="这是我的变量"
echo ${my_variable}
equal_variable=${my_variable}
echo ${equal_variable}
# --------------------------------------------------------------------------------
# 4.3 命令替换
#   从命令中提取信息，将其赋值给变量。
# 将命令输出赋值给变量的两种方法：
#   (1) 反引号字符（`）
#   (2) $() 格式
test_data=`date`
echo ${test_data}
test_date2=$(date)
echo ${test_date2}
today=$(date +%y%m%d)
echo $PATH > "../tests/log.${today}"


# ================================================================================
# 5.重定向输入和输出
# 5.1 输出重定向
#       > 将命令的输出发送到一个文件中，此种操作会用性的文件数据覆盖已有文件
echo $PATH > "../tests/path.txt"
#       >> 将命令的输出追加到已有文件中，通常用于记录日志文件
echo $PATH > "../tests/path.txt"
date >> "../tests/path.txt"
whoami >> "../tests/path.txt"
# ---------------------------------------------------------------------------------
# 5.2 输入重定向
#       < 输入重定向将文件中的内容重定向到命令
#       wc 命令可以对文本中的数据进行计数，输出3个值：文本的行数、文本的词数、文本的字节数
wc < "../tests/path.txt"
#       << 内联输入重定向，你必须指定一个文本标记来划分输入数据的开始和结束。任何字符串都可作为文本标记
#           但在数据的开始和结尾文本标记必须一致
#wc << EOF
#> test1
#> test2
#> test3
#> EOF


# ================================================================================
# 6. 管道
#   在第一个命令产生输出的同时，输出会被立即送给第二个命令。
ls -l | grep log.


# ================================================================================
# 7. 执行数学运算
# 7.1 expr 命令
#   ARG1 | ARG2 如果ARG1既不是null也不是零值，返回ARG1；否则返回ARG2
#   ARG1 & ARG2 如果没有参数是null或零值，返回ARG1；否则返回0
#   ARG1 < ARG2 如果ARG1小于ARG2，返回1；否则返回0
#   ARG1 <= ARG2 如果ARG1小于或等于ARG2，返回1；否则返回0
#   ARG1 = ARG2 如果ARG1等于ARG2，返回1；否则返回0
#   ARG1 != ARG2 如果ARG1不等于ARG2，返回1；否则返回0
#   ARG1 >= ARG2 如果ARG1大于或等于ARG2，返回1；否则返回0
#   ARG1 > ARG2 如果ARG1大于ARG2，返回1；否则返回0
#   ARG1 + ARG2 返回ARG1和ARG2的算术运算和
#   ARG1 - ARG2 返回ARG1和ARG2的算术运算差
#   ARG1 * ARG2 返回ARG1和ARG2的算术乘积
#   ARG1 / ARG2 返回ARG1被ARG2除的算术商
#   ARG1 % ARG2 返回ARG1被ARG2除的算术余数
#   STRING : REGEXP 如果REGEXP匹配到了STRING中的某个模式，返回该模式匹配
#   match STRING REGEXP 如果REGEXP匹配到了STRING中的某个模式，返回该模式匹配
#   substr STRING POS LENGTH 返回起始位置为POS（从1开始计数）、长度为LENGTH个字符的子字符串
#   index STRING CHARS 返回在STRING中找到CHARS字符串的位置；否则，返回0
#   length STRING 返回字符串STRING的数值长度
#   + TOKEN 将TOKEN解释成字符串，即使是个关键字
#   (EXPRESSION) 返回EXPRESSION的值
expr 1 + 5
expr 2 \* 5
expr 1 % 2
echo result is `expr 1 / 2`
# --------------------------------------------------------------------------------
# 7.2 使用方括号
#   在将一个数学运算结果赋给某个变量时，可以用美元符和方括号（$[ operation ]）将数学表达式围起来
var72=$[1 + 5]
echo ${var72}
var721=$[${var72} * (${var72} + ${var72})]
echo The final result is ${var721}
# --------------------------------------------------------------------------------
# 7.3 浮点解决方案
#       bc --- 允许在命令行中输入浮点表达式，然后解释并计算该表达式，最后返回结果
bc      # 然后就开始计算了
bc -q   # -q命令行选项可以不显示bash计算器冗长的欢迎信息。
3.44 / 5
scale=4
3.44 / 5
quit
#       在基本中使用bc命令---用命令替换运行bc命令
var73=$(echo "scale=4; 3.44 / 5" | bc)
var731=$(echo "scale4; ${var73} * ${var73}" | bc)
echo The result is ${var73}
echo double result is ${var731}
#       内联定向输入重定向，允许直接在命令行中重定向数据
var7311=10
var7312=2
var7313=30
var733=$( bc << EOF
scale = 4
al = (${var7311} * ${var7312})
a2 = (${var7312} * ${var7313})
a1 + a2
EOF
)
echo The final answer of this mess is ${var733}


# ================================================================================
# 8. 退出脚本
# 8.1 退出状态码
#   变量$?来保存上个已执行命令的退出状态码
#       一个成功结束的命令的退出状态码是0
#       一个命令结束时有错误，退出状态码就是一个正数值
#   常用的退出状态码：
#       0 命令成功结束
#       1 一般性未知错误
#       2 不适合的shell命令
#       126 命令不可执行
#       127 没找到命令
#       128 无效的退出参数
#       128+x 与Linux信号x相关的严重错误
#       130 通过Ctrl+C终止的命令
#       255 正常范围之外的退出状态码
date
echo $?
date %t
echo $?
# ---------------------------------------------------------------------------
# 8.2 exit命令
#   exit允许在脚本结束时指定一个退出的状态码
var821=10
var822=20
var82=$[${var821} + ${var822}]
echo The answer is ${var82}
exit ${var82}
echo $?