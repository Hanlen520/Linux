#!/bin/bash
# by author: Crisimple
# description: 第十九章 初始sed和gawk

#============================================================================================================
# 19.1 文本处理
    # 19.1.1 sed编辑器---流编辑器（stream editor），与普通编辑器相反
    #···················流编辑器则会在编辑器处理数据之前基于预先提供的一组规则来编辑数据流。
    #···················sed编辑器可以根据命令来处理数据流中的数据，这些命令从命令行中输入，或存储在一个命令文本文件中。
    #···sed编辑器会执行下列操作：
    #·····(1) 一次从输入中读取一行数据。
    #·····(2) 根据所提供的编辑器命令匹配数据。
    #·····(3) 按照命令修改流中的数据
    #·····(4) 将新的数据输出到STDOUT
    #···sed命令的格式如：sed options script file
    #···sed命令选项：
    #······（1）-e script 在处理输入时，将script中指定的命令添加到已有的命令中
    #······（2）-f file 在处理输入时，将file中指定的命令添加到已有的命令中
    #······（3）-n 不产生命令输出，使用print命令来完成输出

    # 1. 在命令行定义编辑器命令
     echo "This is a test" | sed 's/test/big test/'

    # 2. 在命令行使用多个编辑器命令 ---要在sed命令行上执行多个命令时，只要用-e选项就可以了
    sed -e 's/brown/green/; s/dog/cat/' data1.txt

    # 3. 从文件中读取编辑器命令 --- 可以在sed命令中用-f选项来指定文件。
     sed -f script1.sed data1.txt

    # 19.1.2 gawk程序 --- 类编程环境来修改和组织文件中的数据
        # gawk编程语言中可以做到：
        # 1.定义变量来保存数据；
        # 2.使用算数和字符串操作符来处理数据；
        # 3.使用结构化编程（如if-then和循环）来为数据处理增加处理逻辑；
        # 4.通过提取数据文件中的数据元素，将其重新排列或格式化，生成格式化报告

        # 1.gawk命令格式：gawk options program file
            # gawk程序的可用选项
            # -F fs         指定行中划分数据字段的字段分隔符
            # -f file       从指定的文件中读取程序
            # -v var=value  定义gawk程序中的一个变量及其默认值
            # -mf N         指定要处理的数据文件中的最大字段数
            # -mr N         指定数据文件中的最大数据行数
            # -W keyword    指定gawk的兼容模式或警告等级


        # 2. 从命令行读取程序脚本 --- 用一对花括号来定义
            gawk '{print "Hello World!"}'
            # Ctrl+D组合键会在bash中产生一个EOF字符


        # 3. 使用数据字段变量---每个数据字段都是通过字段分隔符划分的（空白字符（例如空格或制 表符））
        #·····················采用了其他字段分隔符的文件，可以用-F选项指定
        #  $0代表整个文本行；
        #  $1代表文本行中的第1个数据字段；
        #  $2代表文本行中的第2个数据字段；
        #  $n代表文本行中的第n个数据字段。


        # 4. 在程序脚本中使用多个命令
             echo "My name is Rich" | gawk '{$4="Christine"; print $0}'


        # 5. 从文件中读取程序 --- 跟sed编辑器一样，gawk编辑器允许将程序存储到文件中，然后再在命令行中引用。
            {print $1 "'s home directory is " $6}
            gawk -F: -f script2.gawk /etc/passwd


        # 6. 在处理数据前运行脚本
            gawk 'BEGIN {print "Hello World!"}'  #会强制gawk在读取数据前执行BEGIN关键字后指定的程序脚本。


        # 7. 在处理数据后运行脚本






#===========================================================================================================
# 19.2 sed编辑器基础
    # 19.2.1 更多的替换选项
        # 1.替换标记
        cat data_test.txt
        This is a test of the test script.
        This is the second trail of the test script.

        sed `s/test/trail/` data_test.txt
        This is a trial of the test script.
        This is the second trial of the test script

        # 4种可用的替换标记:
            # 数字,表明新文本将替换第几处模式匹配的地方;
            # g,表明新文本将会替换所有匹配的文本;
            # p,表明原先文本的内容要打印出来;
            # w file,将替换的结果写到文本中
             sed 's/test/trial/2' data4.txt
             sed 's/test/trial/g' data4.txt
             sed -n 's/test/trial/p' data5.txt
             sed 's/test/trial/w test.txt' data5.txt

         # 2.替换字符---例子就是正斜线（/）
            sed 's/\/bin\/bash/\/bin\/csh/' /etc/passwd
            # ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
            sed 's!/bin/bash!/bin/csh!' /etc/passwd


    # 19.2.2 使用地址---如果只想将命令作用 于特定行或某些行，则必须用行寻址（line addressing）
        # 1.数字方式的行寻址
            #```````在命令中指定的地址可以是单个行号，或是用起始行号、逗号以及结尾行号指定的一定区间 范围内的行
            sed '2s/dog/cat/' data1.txt     # 修改第二行
            sed '2,3s/dog/cat/' data1.txt   # 修改区间行
            sed '2,$s/dog/cat/' data1.txt   # 修改起始行开始的所有行

        # 2. 使用文本模式过滤器
            # sed编辑器在文本模式中采用了一种称为正则 表达式（regular expression）的特性来帮助你创建匹配效果更好的模式

        # 3. 命令组合---如果需要在单行上执行多条命令，可以用花括号将多条命令组合在一起。


    # 19.2.3 删除行---删除命令d名副其实，它会删除匹配指定寻址模式的所有行。
        # sed '2,3d' data6.txt 删除区间行


    # 19.2.4 插入和附加文本
        #  插入（insert）命令（i）会在指定行前增加一个新行；
        #  附加（append）命令（a）会在指定行后增加一个新行。
            sed '3i\
            > This is an inserted line.' data6.txt  # 在第三行的前面插入This is an inserted line.
            sed '3a\
            > This is an appended line.' data6.txt  # 在第三行的前面插入This is an appended line.

    # 19.2.5 修改行
        sed '3c\
        > This is a changed line of text.' data6.txt    # sed编辑器会修改第三行中的文本。

        # 也可以用文本模式来寻址
        sed '/number 3/c\
        > This is a changed line of text.' data6.txt    # sed编辑器会修改第三行中的文本。

    # 19.2.6 转换命令 --- 转换（transform）命令（y）是唯一可以处理单个字符的sed编辑器命令。
        # 命令格式: [address]y/inchars/outchars/
        # 转换命令会对inchars和outchars值进行一对一的映射。inchars中的第一个字符会被转 换为outchars中的第一个字符，
        # 第二个字符会被转换成outchars中的第二个字符。这个映射过 程会一直持续到处理完指定字符。

    # 19.2.7 回顾打印
        # 打印数据流中的信息：
            #  p命令用来打印文本行；
            #  等号（=）命令用来打印行号；
            #  l（小写的L）命令用来列出行.

        # 1.打印行---跟替换命令中的p标记类似，p命令可以打印sed编辑器输出中的一行。
             echo "this is a test" | sed 'p'

             $ cat data6.txt
             This is line number 1.
             This is line number 2.
             This is line number 3.
             This is line number 4.
             # 在命令行上用-n选项，你可以禁止输出其他行，只打印包含匹配文本模式的行
             sed -n '/number 3/p' data6.txt

        # 2. 打印行号
             sed '=' data1.txt   # 可显示出文本的行号
              sed -n '/number 4/{
              > =
              > p
              > }' data6.txt    # 打印特定的行号的文本

        # 3. 列出行


    # 19.2.8 使用sed处理文件
        # 1. 写入文件 --- w命令用来向文件写入行
             sed '1,2w test.txt' data6.txt  # 将数据流中的前两行打印到一个文本文件中

        # 2. 从文件读取数据 --- 读取（read）命令（r）允 许你将一个独立文件中的数据插入到数据流中
            sed '3r data12.txt' data6.txt   # 将data12.txt文本中的内容读取到data6.txt文本第三行的前面去插入
                                            # 如果你要在数据流的末尾添加文本，只需用美元符地址符就行了。

            $ sed '/LIST/{
            > r data11.txt
            > d
            > }' notice.std     # 实现占位的效果