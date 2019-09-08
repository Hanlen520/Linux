#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第六章 使用Linux环境变量

echo "================================================================================================================="
echo "6.1 什么是环境变量 -- 存储有关shell会话和工作环境的信息"
    echo "\t 6.1.1 全局环境变量---使用全大写字母；查看全局变量：printenv"
        printenv
        # 显示个别的系统环境变量
        printenv HOME
        echo $HOME
        ls $HOME

    echo "\t 6.1.2 局部环境变量---set命令查看所有环境变量：局部 + 全局 + 用户定义变量"


echo "================================================================================================================="
echo "6.2 设置用户定义变量"
    echo -e "\t 6.2.1 设置局部用户定义变量"
        my_variable="this is my variable"
        echo ${my_variable}
        # 退出子进程，局部变量就不可用了
#        bash
#        my_child_variable="Hello, I am child process"
#        echo ${my_child_variable}
#        exit
        echo ${my_child_variable}

    echo -e "\t 6.2.2 设置全局环境变量"
        my_global="I am global variable"
        export my_global
        echo ${my_global}
#        bash
#        echo ${my_global}
#        my_global="I am child process, I will change my value, in child process, I am changed, but in father process..."
#        export my_global
#        echo ${my_global}
#        exit
        echo ${my_global}




echo "================================================================================================================="
echo "6.3 删除环境变量"
    my_unset_variable="I am Global now"
    echo ${my_unset_variable}



echo "================================================================================================================="
echo "6.4 默认的shell环境变量"

    echo "\t bash shell支持的Bourne变量 "
    echo "\t CDPATH    	冒号分隔的目录列表，作为cd命令的搜索路径 "
    echo "\t HOME 		当前用户的主目录 "
    echo "\t IFS 		shell用来将文本字符串分割成字段的一系列字符 "
    echo "\t MAIL 		当前用户收件箱的文件名（bash shell会检查这个文件，看看有没有新邮件） "
    echo "\t MAILPATH 	冒号分隔的当前用户收件箱的文件名列表（bash shell会检查列表中的每个文件，看看有没有新邮件） "
    echo "\t OPTARG 		getopts命令处理的最后一个选项参数值 "
    echo "\t OPTIND 		getopts命令处理的最后一个选项参数的索引号 "
    echo "\t PATH 		shell查找命令的目录列表，由冒号分隔 "
    echo "\t PS1 		shell命令行界面的主提示符 "
    echo "\t PS2 		shell命令行界面的次提示符  "

    echo "\t bash shell环境变量 "
    echo "\t BASH 						当前shell实例的全路径名 "
    echo "\t BASH_ALIASES 				含有当前已设置别名的关联数组 "
    echo "\t BASH_ARGC 					含有传入子函数或shell脚本的参数总数的数组变量 "
    echo "\t BASH_ARCV 					含有传入子函数或shell脚本的参数的数组变量 "
    echo "\t BASH_CMDS 					关联数组，包含shell执行过的命令的所在位置 "
    echo "\t BASH_COMMAND 				shell正在执行的命令或马上就执行的命令 "
    echo "\t BASH_ENV 					设置了的话，每个bash脚本会在运行前先尝试运行该变量定义的启动文件 "
    echo "\t BASH_EXECUTION_STRING  	使用bash -c选项传递过来的命令 "
    echo "\t BASH_LINENO 				含有当前执行的shell函数的源代码行号的数组变量 "
    echo "\t BASH_REMATCH 				只读数组，在使用正则表达式的比较运算符=~进行肯定匹配（positive match）时， 包含了匹配到的模式和子模式 B "
    echo "\t ASH_SOURCE 				含有当前正在执行的shell函数所在源文件名的数组变量 "
    echo "\t BASH_SUBSHELL 				当前子shell环境的嵌套级别（初始值是0） "
    echo "\t BASH_VERSINFO 				含有当前运行的bash shell的主版本号和次版本号的数组变量 "
    echo "\t BASH_VERSION 				当前运行的bash shell的版本号 "
    echo "\t BASH_XTRACEFD 				若设置成了有效的文件描述符（0、1、2），则'set -x'调试选项生成的跟踪输出 可被重定向。通常用来将跟踪输出到一个文件中 "
    echo "\t BASHOPTS 					当前启用的bash shell选项的列表 "
    echo "\t BASHPID 					当前bash进程的PID COLUMNS 当前bash shell实例所用终端的宽度 "
    echo "\t COMP_CWORD 				COMP_WORDS变量的索引值，后者含有当前光标的位置 "
    echo "\t COMP_LINE 					当前命令行 "
    echo "\t COMP_POINT 				当前光标位置相对于当前命令起始的索引 "
    echo "\t COMP_KEY 					用来调用shell函数补全功能的最后一个键 "
    echo "\t COMP_TYPE 					一个整数值，表示所尝试的补全类型，用以完成shell函数补全 "
    echo "\t COMP_WORDBREAKS 			Readline库中用于单词补全的词分隔字符 "
    echo "\t COMP_WORDS 				含有当前命令行所有单词的数组变量 "
    echo "\t COMPREPLY 					COPROC 含有由shell函数生成的可能填充代码的数组变量 占用未命名的协进程的I/O文件描述符的数组变量 "
    echo "\t DIRSTACK 					含有目录栈当前内容的数组变量 "
    echo "\t EMACS 						设置为't'时，表明emacs shell缓冲区正在工作，而行编辑功能被禁止 "
    echo "\t ENV 						如果设置了该环境变量，在bash shell脚本运行之前会先执行已定义的启动文件（仅 用于当bash shell以POSIX模式被调用时） "
    echo "\t EUID 						当前用户的有效用户ID（数字形式） "
    echo "\t FCEDIT 					供fc命令使用的默认编辑器 "
    echo "\t FIGNORE 					在进行文件名补全时可以忽略后缀名列表，由冒号分隔 "
    echo "\t FUNCNAME 					当前执行的shell函数的名称  "
    echo "\t FUNCNEST 				    当设置成非零值时，表示所允许的最大函数嵌套级数（一旦超出，当前命令即被终止）  "
    echo "\t GLOBIGNORE 				冒号分隔的模式列表，定义了在进行文件名扩展时可以忽略的一组文件名  "
    echo "\t GROUPS 					含有当前用户属组列表的数组变量  "
    echo "\t histchars 				    控制历史记录扩展，最多可有3个字符  "
    echo "\t HISTCMD 				    当前命令在历史记录中的编号  "
    echo "\t HISTCONTROL 			    控制哪些命令留在历史记录列表中  "
    echo "\t HISTFILE 				    保存shell历史记录列表的文件名（默认是.bash_history）  "
    echo "\t HISTFILESIZE 			    HISTTIMEFORMAT 最多在历史文件中存多少行 如果设置了且非空，就用作格式化字符串，以显示bash历史中每条命令的时间戳  "
    echo "\t HISTIGNORE 				由冒号分隔的模式列表，用来决定历史文件中哪些命令会被忽略  "
    echo "\t HISTSIZE 				    最多在历史文件中存多少条命令  "
    echo "\t HOSTFILE 				    shell在补全主机名时读取的文件名称  "
    echo "\t HOSTNAME 				    当前主机的名称  "
    echo "\t HOSTTYPE 				    当前运行bash shell的机器  "
    echo "\t IGNOREEOF 				    shell在退出前必须收到连续的EOF字符的数量（如果这个值不存在，默认是1）  "
    echo "\t INPUTRC 				    Readline初始化文件名（默认是.inputrc）  "
    echo "\t LANG 					    shell的语言环境类别 LC_ALL 定义了一个语言环境类别，能够覆盖LANG变量  "
    echo "\t LC_COLLATE 				设置对字符串排序时用的排序规则  "
    echo "\t LC_CTYPE 				    决定如何解释出现在文件名扩展和模式匹配中的字符  "
    echo "\t LC_MESSAGES 			    在解释前面带有\$的双引号字符串时，该环境变量决定了所采用的语言环境设置  "
    echo "\t LC_NUMERIC 				决定着格式化数字时采用的语言环境设置  "
    echo "\t LINENO 					当前执行的脚本的行号  "
    echo "\t LINES 					    定义了终端上可见的行数  "
    echo "\t MACHTYPE 				    用“CPU?公司?系统”（CPU-company-system）格式定义的系统类型  "
    echo "\t MAPFILE 				    一个数组变量，当mapfile命令未指定数组变量作为参数时，它存储了mapfile所读入的文本  "
    echo "\t MAILCHECK 				    shell查看新邮件的频率（以秒为单位，默认值是60）  "
    echo "\t OLDPWD 					shell之前的工作目录 OPTERR 设置为1时，bash shell会显示getopts命令产生的错误  "
    echo "\t OSTYPE 					定义了shell所在的操作系统  "
    echo "\t PIPESTATUS 				含有前台进程的退出状态列表的数组变量  "
    echo "\t POSIXLY_CORRECT 		    设置了的话，bash会以POSIX模式启动  "
    echo "\t PPID 					    bash shell父进程的PID PROMPT_COMMAND 设置了的话，在命令行主提示符显示之前会执行这条命令  "
    echo "\t PROMPT_DIRTRIM 			用来定义当启用了\w或\W提示符字符串转义时显示的尾部目录名的数量。被删除的 目录名会用一组英文句点替换  "
    echo "\t PS3 					    select命令的提示符   "
    echo "\t PS4 			            如果使用了bash的-x选项，在命令行之前显示的提示信息 "
    echo "\t PWD 			            当前工作目录 RANDOM 返回一个0～32767的随机数（对其的赋值可作为随机数生成器的种子） "
    echo "\t READLINE_LINE 	            当使用bind –x命令时，存储Readline缓冲区的内容 "
    echo "\t READLINE_POINT 	        当使用bind –x命令时，表示Readline缓冲区内容插入点的当前位置 "
    echo "\t REPLY 			            read命令的默认变量 "
    echo "\t SECONDS 		            自从shell启动到现在的秒数（对其赋值将会重置计数器） "
    echo "\t SHELL 			            bash shell的全路径名 SHELLOPTS 已启用bash shell选项列表，列表项之间以冒号分隔 "
    echo "\t SHLVL 			            shell的层级；每次启动一个新bash shell，该值增加1 "
    echo "\t TIMEFORMAT 		        指定了shell的时间显示格式 "
    echo "\t TMOUT 			            select和read命令在没输入的情况下等待多久（以秒为单位）。默认值为0，表示 无限长 TMPDIR 目录名，保存bash shell创建的临时文件 UID 当前用户的真实用户ID "




echo "================================================================================================================="
echo "6.5 设置PATH环境变量"
    echo $PATH



echo "================================================================================================================="
echo "6.6 定位系统环境变量 "
    echo "6.6.1 登陆shell"
#        ? /etc/profile                     主启动文件
#        ? $HOME/.bash_profile              以下四个为发行版本启动文件
#        ? $HOME/.bashrc
#        ? $HOME/.bash_login
#        ? $HOME/.profile

    echo "6.6.2 交互式shell进程--只会检查用户HOME目录中的.bashrc文件"

    echo "6.6.3 非交互式 shell--bash shell提供了BASH_ENV环境变量[printenv BASH_ENV]"

    echo "6.6.4 环境变量持久化 "



echo "================================================================================================================="
echo "6.7 数组变量"
    my_array=(one two three four five)
    echo ${my_array[2]}
    echo ${my_array[*]}
    my_array[3]=seven
    echo ${my_array[3]}
    # 删除数组
    unset my_array
    echo ${my_array[*]}
