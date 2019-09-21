#!/usr/bin/env bash
# @File    :   18_regular_expression.sh
# @Time    :   2019/9/21 16:14
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None

# 1. 正则表达式的定义
#   正则表达式是你所定义的模式模板（pattern template）。
#   正则表达式模式利用通配符来描述数据流中的一个或多个字符
#   正则表达式的类型：
#       POSIX基础正则表达式（basic regular expression，BRE）引擎            ----- 大多数都符合
#       POSIX扩展正则表达式（extended regular expression，ERE）引擎


# ======================================================================================
# 2. 定义 BRE 模式
# 2.1 纯文本
#   只要正则中出现匹配模式即可匹配成功
echo "This is a text." | sed -n '/text/p'
echo "This is a text." | gawk '/text/{print $0}'
echo "This is a text." | gawk '/ext/{print $0}'
echo "This is a text." | sed -n '/ /p'
# -------------------------------------------------------------------------------------
# 2.2 特殊字符
#   特殊字符包括：.*[]^${}\+?|()
#   如果要用某个特殊字符作为文本字符，就必须使用反斜杠（\）转义
echo "The cost is \$4.0" | sed -n '/\$/p'
echo "\ is a special character" | sed -n '/\\/p'
echo "6 / 2" | sed -n '/\//p'
# -------------------------------------------------------------------------------------
# 2.3 锚字符
#   有两个特殊字符可以用来将模式锁定在数据流中的行首或行尾
#   脱字符（^）定义从数据流中文本行的行首开始的模式
echo "The character is start" | sed -n '/^The/p'
echo "The character is start" | sed -n '/^the/p'
#   美元符（$）放在文本模式之后来指明数据行必须以该文本模式结尾
echo "The character is end" | sed -n '/end$/p'
echo "The character is end" | sed -n '/end.$/p'
#   锚点组合
echo "The characters are start or end" | sed -n '/^The characters are$/p'
# -------------------------------------------------------------------------------------
# 2.4 点号字符
echo "The sed is so good." | sed -n '/.ed/p'
# -------------------------------------------------------------------------------------
# 2.5 字符组
echo "The sed is so good." | sed -n '/[abs]ed/p'
echo "The seed is so good." | sed -n '/[abs][ae]ed/p'
# -------------------------------------------------------------------------------------
# 2.6 排除型字符组
#   只要在字符组的开头加个脱字符
echo "The sed is so good." | sed -n '/[^abs]ed/p'
echo "The sed is so good." | sed -n '/[^abc]ed/p'
# -------------------------------------------------------------------------------------
# 2.7 区间
echo "a8392" | sed -n '/^[0-9][0-9][0-9][0-9][0-9]$/p'
echo "18392" | sed -n '/^[0-9][0-9][0-9][0-9][0-9]$/p'
echo "dat" | sed -n '/[c-h]at/p'
# -------------------------------------------------------------------------------------
# 2.8 特殊的字符组
#       [[:alpha:]] 匹配任意字母字符，不管是大写还是小写
#       [[:alnum:]] 匹配任意字母数字字符0~9、A~Z或a~z
#       [[:blank:]] 匹配空格或制表符
#       [[:digit:]] 匹配0~9之间的数字
#       [[:lower:]] 匹配小写字母字符a~z
#       [[:print:]] 匹配任意可打印字符
#       [[:punct:]] 匹配标点符号
#       [[:space:]] 匹配任意空白字符：空格、制表符、NL、FF、VT和CR
#       [[:upper:]] 匹配任意大写字母字符A~Z
echo "abc" | sed -n "/[[:alpha:]]/p"
echo "abc" | sed -n '/[[:alpha:]]/p'
# -------------------------------------------------------------------------------------
# 2.9 星号
#   在字符后面放置星号表明该字符必须在匹配模式的文本中出现0次或多次
echo "abcdef" | sed -n "/a*f/p"
echo "abcdef" | sed -n "/abcde*f/p"
echo "abcdef" | sed -n "/abcdef*/p"


# ======================================================================================
# 3. 扩展正则（ERE）表达式
#   POSIX ERE模式包括了一些可供Linux应用和工具使用的额外符号。gawk程序能够识别ERE模式，但sed编辑器不能。
# -------------------------------------------------------------------------------------
# 3.1 问号
#   问号表明前面的字符可以出现0次或1次，和星号类似但是不能匹配多次
echo "bt" | sed -n '/b?t/p'   # sed编辑器不能用
echo "bt" | gawk '/b?t/{print $0}'
echo "bat" | gawk '/b[ae]?t/{print $0}'
echo "bot" | gawk '/b[ae]?t/{print $0}'
echo "beet" | gawk '/b[ee]?t/{print $0}'  # 不输出
echo "beet" | gawk '/b[ee]?et/{print $0}' # 输出
# -------------------------------------------------------------------------------------
# 3.2 加号
#   加号表明前面的字符可以出现1次或多次，但必须至少出现1次。如果该字符没有出现，那么模式就不会匹配。
echo "beeet" | gawk '/be+t/{print $0}'
echo "bet" | gawk '/be+t/{print $0}'
echo "bt" | gawk '/be+t/{print $0}'
echo "bat" | gawk '/b[ae]+t/{print $0}'
echo "bt" | gawk '/b[ae]+t/{print $0}'
# -------------------------------------------------------------------------------------
# 3.3 使用花括号
#   默认情况下，gawk程序不会识别正则表达式间隔。必须指定gawk程序的--re- interval命令行选项才能识别正则表达式间隔。
#   ERE中的花括号允许你为可重复的正则表达式指定一个上限
#        m：正则表达式准确出现m次。
#        m, n：正则表达式至少出现m次，至多n次。
#       这个特性可以精确调整字符或字符集在模式中具体
echo "bt" | gawk --re-interval '/be{1}t/{print $0}'
echo "beet" | gawk --re-interval '/be{1,2}t/{print $0}'
echo "bat" | gawk --re-interval '/b[ae]{1,2}t/{print $0}'
# 3.4 管道符号
#   管道符号允许你在检查数据流时，用逻辑OR方式指定正则表达式引擎要用的两个或多个模式
echo "The cat is asleep" | gawk '/cat|dog/{print $0}'
echo "The dog is asleep" | gawk '/cat|dog/{print $0}'
echo "The sheep is asleep" | gawk '/cat|dog/{print $0}'
# 3.5 表达式分组
#   正则表达式模式也可以用圆括号进行分组。
#   当你将正则表达式模式分组时，该组会被视为一个标准字符。可以像对普通字符一样给该组使用特殊字符
echo "Sat" | gawk '/Sat(urday)?/{print $0}'
echo "Saturday" | gawk '/Sat(urday)?/{print $0}'
echo "cab" | gawk '/(c|b)a(b|t)/{print $0}'
echo "tac" | gawk '/(c|b)a(b|t)/{print $0}'    # 不输出


# ======================================================================================
# 4. 正则表达式实战
# 4.1 目录文件计数
$ echo $PATH | sed 's/:/ /g'
$ cat filecount.sh
mypath=$(echo $PATH | sed 's/:/ /g')
count=1
for dir in ${mypath}
do
    check=$( ls ${dir})
    for item in ${check}
    do
        count=$[ ${count} + 1 ]
    done
    echo "${dir} - ${count}"
    count=0
done
# 4.2 验证电话号码
#   美国电话的几种形式
#       (123)456-7890
#       (123) 456-7890
#       123-456-7890
#       123.456.7890
gawk --re-interval '/^\(?[2-9][0-9]{2}\)?(| |-|\¬[0-9]{3}( |-|\.)[0-9]{4}/{print $0}'
# 4.3 解析邮件地址
#    邮件的组合形式username@hostname.com
gawk --re-interval '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'
echo "123_test@163.com" | gawk --re-interval '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'
echo "?@163.com" | gawk --re-interval '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'
