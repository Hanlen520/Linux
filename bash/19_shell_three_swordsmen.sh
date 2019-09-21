#!/usr/bin/env bash
# @File    :   19_shell_three_swordsmen.sh
# @Time    :   2019/9/21 18:49
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. grep 命令
#   grep更适合单纯的查找或匹配文本；
#   grep 的命令参数
#       -i：在搜索的时候忽略大小写
#       -n：显示结果所在行号
#       -c：统计匹配到的行数，注意，是匹配到的总行数，不是匹配到的次数
#       -o：只显示符合条件的字符串，但是不整行显示，每个符合条件的字符串单独显示一行
#       -v：输出不带关键字的行（反向查询，反向匹配）
#       -w：匹配整个单词，如果是字符串中包含这个单词，则不作匹配
#       -Ax：在输出的时候包含结果所在行之后的指定行数，这里指之后的x行，A：after
#       -Bx：在输出的时候包含结果所在行之前的指定行数，这里指之前的x行，B：before
#       -Cx：在输出的时候包含结果所在行之前和之后的指定行数，这里指之前和之后的x行，C：context
#       -e：实现多个选项的匹配，逻辑or关系
#       -q：静默模式，不输出任何信息，当，使用"echo $?"查看是否匹配到，0表示匹配到，1表示没有匹配到。
#       -P：表示使用兼容perl的正则引擎。
#       -E：使用扩展正则表达式，而不是基本正则表达式，在使用"-E"选项时，相当于使用egrep。
grep -n "Q" "./tests/grep_file.txt"
grep -i "Test" "./tests/grep_file.txt"
grep -c "test" "./tests/grep_file.txt"
grep -o "st" "./tests/grep_file.txt"
grep -wn "test" "./tests/grep_file.txt"
grep -A8 "123" "./tests/grep_file.txt"
grep -B8 "123" "./tests/grep_file.txt"
grep -C1 "o" "./tests/grep_file.txt"
grep -on "234" "./tests/grep_file.txt"
grep -on -e "234" -e"test" "./tests/grep_file.txt"
grep -nq "o" "./tests/grep_file.txt"
echo $?
grep -nP '^t\d+[ea]t' "./tests/grep_file.txt"
grep -P '\d+' "./tests/grep_file.txt"

# ======================================================================================
# 2. sed 命令
# 2.1 打印
# 2.2 增加
# 2.3 删除
# 2.4 编辑
#   1.1 sed编辑器被称作流编辑器（stream editor），和普通的交互式文本编辑器恰好相反。
#       (1) 一次从输入中读取一行数据。
#       (2) 根据所提供的编辑器命令匹配数据。
#       (3) 按照命令修改流中的数据。
#       (4) 将新的数据输出到STDOUT
#   1.2 sed 命令选项
#       -e script 在处理输入时，将script中指定的命令添加到已有的命令中
#       -f file 在处理输入时，将file中指定的命令添加到已有的命令中
#       -n 不产生命令输出，使用print命令来完成输出
#       s命令会用斜线间指定的第二个文本字符串来替换第一个文本字符串模式
$ cat data1.txt
$ The quick brown fox jumps over the lazy dog.
$ The quick brown fox jumps over the lazy dog.
$ The quick brown fox jumps over the lazy dog.
$ The quick brown fox jumps over the lazy dog.
$
$ sed 's/dog/cat/' data1.txt
$ echo "This is a test" | sed 's/test/big test/'
$ sed -e 's/brown/green/; s/dog/cat/' data1.txt    # 要在sed命令行上执行多个命令时，只要用-e选项就可以了。
#   1.3
$ cat script1.sed
s/brown/green/
s/fox/elephant/
s/dog/cat/
$ sed -f script1.sed data1.txt


# ======================================================================================
# 3. gawk 命令