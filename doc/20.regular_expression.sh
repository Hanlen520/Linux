#!/bin/bash
# by author: Crisimple
# description: 第二十章 正则表达式

#=======================================================================================================================
# 20.1 什么是正则表达式
    # 20.1.1 定义 --- 正则表达式是你所定义的模式模板（pattern template），Linux工具可以用它来过滤文本


    # 20.1.2 正则表达式的类型---正则表达式是通过正则表达式引擎（regular expression engine）实现的。
                           #---正则表达式引擎是一套底层软件，负责解释正则表达式模式并使用这些模式进行文本匹配。
       # 在Linux中，有两种流行的正则表达式引擎：
       # POSIX基础正则表达式（basic regular expression，BRE）引擎
       # POSIX扩展正则表达式（extended regular expression，ERE）引擎




#=======================================================================================================================
# 20.2 定义BRE模式 --- 基本的BRE模式是匹配数据流中的文本字符.
    # 20.2.1 纯文本
        echo "This is a test" | sed -n '/test/p'          # 该字符串匹配了test,所以打印该字符串
        echo "This is a test" | sed -n '/trail/p'         # 字符串不匹配trail,所以打印为空
        echo "This is a test" | gawk '/test/{print $0}'   # 同上
        echo "This is a test" | gawk '/trail/{print $0}'  # 同上
        # 正则表达式匹配原则:
        #`````````1.正则表达式模式都区分大小写;
            echo "This is a test." | sed -n '/This/p'   # 打印字符串
            echo "This is a test"  | sed -n '/this/p'   # 打印为空
        #`````````2.只要被匹配的文本在数据流中完整的出现,正则表达式均可以完整的匹配出来
            echo "I think regular expression is so interesting." | sed -n '/lar ex/p'   # 被匹配的部分文本在数据流中完整出现了


    # 20.2.2 特殊字符 --- 正则表达式识别的特殊字符包括： .*[]^${}\+?|(),在文本模式中不能单独使用这些字符;
                    #--- 如果想将特殊字符作为文本字符的话,就必须转义(\)
        echo "\ is a special character." | sed -n '/\\/p'   # 打印\ is a special character.
        echo " 3 / 2 " | sed -n '/\//p' # 打印3 / 2


    # 20.2.3 锚文字
        # 1.锁在行首---脱字符（^）定义从数据流中文本行的行首开始的模式.如果模式出现在行首之外的位置,正则表达式模式则无法匹配。
                  #---如果你将脱字符放到模式开头之外的其他位置，那么它就跟普通字符一样，不再是特殊字符
            echo "The book is good." | sed -n '/^book/p'    # 打印为空
            echo "Books are great." | sed -n '/^Book/p'     # 打印Books are great.

        # 2.锁定在行尾---殊字符美元符（$）定义了行尾锚点。特殊字符放在文本模式之后来指明数据行必须以该文本模式结尾。
            echo "This is a good book" | sed -n "/book$/p"  # 打印This is a good book

        # 3. 组合锚点 --- 可以在同一行中将行首锚点和行尾锚点组合在一起使用
                    #--- 用这种可以过滤文本中的空行
            cat file_text.txt
            # It is a good book.
            #
            # Yes, is is
            sed '/^$/d' file_text.txt


    # 20.2.4 点号字符---特殊字符点号用来匹配除换行符之外的任意单个字符。
                   #---它必须匹配一个字符，如果在点号字符的位置没有字符，那么模式就不成立。
        # $ cat data6
        # This is a test of a line.
        # The cat is sleeping.
        # That is a very nice hat.
        # This test is at line four.
        # at ten o'clock we'll go home.
        sed -n '/.at/p' data6


    # 20.2.5 字符组---字符组中的某个字符出现在了数据流中，那它就匹配了该模式。使用方括号来定义一个字符组
        sed -n '/[ch]at/p' data6
        # 在不太确定某个字符的大小写时，字符组会非常有用。
            echo "Yes" | sed -n '/[Yy]es/p'
            echo "yes" | sed -n '/[Yy]es/p'
        # 字符组不必只含有字母，也可以在其中使用数字。
            # $ cat data7
            # This line doesn't contain a number.
            # This line has 1 number on it.
            # This line a number 2 on it.
            # This line has a number 4 on it.
            sed -n '/[0123]/p' data7


    # 20.2.6 排除型字符组 --- 在正则表达式模式中，也可以反转字符组的作用
                        #--- 只要在字符组的开头加个脱字符。
        sed -n '/[^ch]at/p' data6

    # 20.2.7 区间 --- 可以用单破折线符号在字符组中表示字符区间。只需要指定区间的第一个字符、单破折线以及区间的后一个字符就行了。
        sed -n '/^[0-9][0-9][0-9][0-9][0-9]$/p' data8
        # 同样的方法也适用于字母
            sed -n '/[c-h]at/p' data6
        # 还可以在单个字符组指定多个不连续的区间
            sed -n '/[a-ch-m]at/p' data6

    # 20.2.8 特殊的字符组 --- BRE还包含了一些特殊的字符组，可用来匹配特定类型的字符。
        # [[:alpha:]] 匹配任意字母字符，不管是大写还是小写
        # [[:alnum:]] 匹配任意字母数字字符0~9、A~Z或a~z
        # [[:blank:]] 匹配空格或制表符
        # [[:digit:]] 匹配0~9之间的数字
        # [[:lower:]] 匹配小写字母字符a~z
        # [[:print:]] 匹配任意可打印字符
        # [[:punct:]] 匹配标点符号
        # [[:space:]] 匹配任意空白字符：空格、制表符、NL、FF、VT和CR
        # [[:upper:]] 匹配任意大写字母字符A~Z


    # 20.2.9 星号---在字符后面放置星号表明该字符必须在匹配模式的文本中出现0次或多次。
        echo "ik" | sed -n '/ie*k/p'
        echo "ieeek" | sed -n '/ie*k/p'
        # 在可能出现的额外字母后面放个星号将允许接受拼错的单词。
        # 另一个方便的特性是将点号特殊字符和星号特殊字符组合起来。这个组合能够匹配任意数量的任意字符。
            # 它通常用在数据流中两个可能相邻或不相邻的文本字符串之间


#=======================================================================================================================
# 20.3 扩展正则表达式
    # 20.3.1 问号---问号表明前面的字符可以出现0次或1次，但只限于此
            echo "bt" | gawk '/be?t/{print $0}'     # bt
            echo "bet" | gawk '/be?t/{print $0}'    # bet
            echo "beet" | gawk '/be?t/{print $0}'   # 打印为空
        # 与星号一样，你可以将问号和字符组一起使用
            echo "bt" | gawk '/b[ae]?t/{print $0}'   # bt
            echo "bat" | gawk '/b[ae]?t/{print $0}'  # bat
            echo "bot" | gawk '/b[ae]?t/{print $0}'  # 打印为空
            # 注意:如果字符组中的字符出现了0次或1次,模式匹配就成立.但如果两个字符都出现了,或者其中一个字符出现了2次,模式匹配就不成立。
            echo "beet" | gawk '/b[ae]?t/{print $0}'    # 打印为空


    # 20.3.2 加号 --- 加号表明前面的字符可以出现1次或多次，但必须至少出现1次。如果该字符没有出现，那么模式就不会匹配。
            echo "beet" | gawk '/be+t/{print $0}'   # beet
            echo "bet" | gawk '/be+t/{print $0}'    # bet
            echo "bt" | gawk '/be+t/{print $0}'     # 打印为空
        # 加号同样适用于字符组，与星号和问号的使用方式相同
            echo "bt" | gawk '/b[ae]+t/{print $0}'      # 打印为空
            echo "beeat" | gawk '/b[ae]+t/{print $0}'   # beeat

    # 20.3.3 使用花括号 --- ERE中的花括号允许你为可重复的正则表达式指定一个上限,称为间隔
            # 可以用两种格式来指定区间:  m：正则表达式准确出现m次。
                                  #   m, n：正则表达式至少出现m次，至多n次。
        # 注意:gawk程序不会识别正则表达式间隔。必须指定gawk程序的--re- interval 命令行选项才能识别正则表达式间隔。
            echo "bt" | gawk --re-interval '/be{1}t/{print $0}'         # 打印为空
            echo "bet" | gawk --re-interval '/be{1}t/{print $0}'        # bet
            echo "beet" | gawk --re-interval '/be{1}t/{print $0}'       # 打印为空
            echo "beeet" | gawk --re-interval '/be{1,2}t/{print $0}'    # 打印为空
        # 间隔模式匹配同样适用于字符组
            echo "beeat" | gawk --re-interval '/b[ae]{1,2}t/{print $0}'     # 打印为空

    # 20.3.4 管道符号 --- 在检查数据流时，用逻辑OR方式指定正则表达式引擎要用的两个或多个模式。
                    #--- 如果任何一个模式匹配了数据流文本，文本就通过测试。如果没有模式匹配，则数据流文本匹配失败。
            echo "The cat is asleep" | gawk '/cat|dog/{print $0}'       # The cat is asleep
            echo "The sheep is asleep" | gawk '/cat|dog/{print $0}'     # 打印为空

        # 管道符号两侧的正则表达式可以采用任何正则表达式模式（包括字符组）来定义文本
            echo "He has a hat." | gawk '/[ch]at|dog/{print $0}'    # He has a hat.

    # 20.3.5 表达式分组 --- 正则表达式模式也可以用圆括号进行分组。当你将正则表达式模式分组时，该组会被视为一个标准字符。
            echo "Sat" | gawk '/Sat(urday)?/{print $0}'         # Sat
            echo "Saturday" | gawk '/Sat(urday)?/{print $0}'    # Saturday


#=======================================================================================================================
# 20.4 正则表达式实战
    # 20.4.1 目录文件计数
        #!/bin/bash
        # by author: Crisimple
        # description: count number of files in your path; count_files.sh
        myPath=$(echo $PATH | sed 's/:/ /g')
        count=0
        for directory in ${myPath}
        do
            check=$(ls ${directory})
            for item in ${check}
            do
                count=$[ ${count} + 1 ]
            done
            echo '${directory} - ${count}'
            count=0
        done

    # 20.4.2 验证电话号码

    # 20.4.3 解析邮件地址





