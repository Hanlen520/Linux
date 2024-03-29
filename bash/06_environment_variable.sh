#!/usr/bin/env bash
# @File    :   06_environment_variable.sh
# @Time    :   2019/9/14 12:31
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# 1. 环境变量
# 1.1 全局环境变量
# 查看全局变量
env
printenv
# 显示个别环境变量的值
printenv HOME
echo $HOME
ls $HOME
# 全局环境变量可用于进程的所有子 shell
bash
ps -ef
echo $HOME
exit
#   1.2 局部环境变量
set


# 2. 自定义环境变量
# 2.1 设置局部用户定义变量
# 通过等号给环境变量复制，值可以时数字或字符串
my_variable='hello world'
echo $my_variable
# 设置了局部环境变量后，就能在shell进程的任何地方使用它了。但是，如果生成了另外一个shell，它在子shell中就不可用。
bash
echo $my_variable
exit
echo $my_variable

# 2.2 设置全局环境变量
# 创建全局环境变量的方法是先创建一个局部环境变量，然后再把它导出到全局环境中。
my_global_variable='I am Global now'
bash
echo $my_global_variable
exit
export my_global_variable
echo $my_global_variable
bash
echo $my_global_variable
exit
echo $my_global_variable

# 3. 删除环境变量
# 既然可以创建新的环境变量，自然也能删除已经存在的环境变量。可以用unset命令完成这个操作。在unset命令中引用环境变量时，记住不要使用$
# 承接2.2中的全局变量赋值
echo $my_global_variable
unset my_global_variable
echo $my_global_variable

# 4. 默认的 shell 环境变量
# CDPATH              冒号分隔的目录列表，作为cd命令的搜索路径
# HOME                当前用户的主目录
# IFS shell           用来将文本字符串分割成字段的一系列字符
# MAIL                当前用户收件箱的文件名（bash shell会检查这个文件，看看有没有新邮件）
# MAILPATH            冒号分隔的当前用户收件箱的文件名列表（bash shell会检查列表中的每个文件，看看有没有新邮件）
# OPTARG getopts      命令处理的最后一个选项参数值
# OPTIND getopts      命令处理的最后一个选项参数的索引号
# PATH shell          查找命令的目录列表，由冒号分隔
# PS1 shell           命令行界面的主提示符
# PS2 shell           命令行界面的次提示符
# ...
# BASH 						当前shell实例的全路径名 "
# BASH_ALIASES 				含有当前已设置别名的关联数组 "
# BASH_ARGC 					含有传入子函数或shell脚本的参数总数的数组变量 "
# BASH_ARCV 					含有传入子函数或shell脚本的参数的数组变量 "
# BASH_CMDS 					关联数组，包含shell执行过的命令的所在位置 "
# BASH_COMMAND 				shell正在执行的命令或马上就执行的命令 "
# BASH_ENV 					设置了的话，每个bash脚本会在运行前先尝试运行该变量定义的启动文件 "
# BASH_EXECUTION_STRING  	使用bash -c选项传递过来的命令 "
# BASH_LINENO 				含有当前执行的shell函数的源代码行号的数组变量 "
# BASH_REMATCH 				只读数组，在使用正则表达式的比较运算符=~进行肯定匹配（positive match）时， 包含了匹配到的模式和子模式 B "
# ASH_SOURCE 				含有当前正在执行的shell函数所在源文件名的数组变量 "
# BASH_SUBSHELL 				当前子shell环境的嵌套级别（初始值是0） "
# BASH_VERSINFO 				含有当前运行的bash shell的主版本号和次版本号的数组变量 "
# BASH_VERSION 				当前运行的bash shell的版本号 "
# BASH_XTRACEFD 				若设置成了有效的文件描述符（0、1、2），则'set -x'调试选项生成的跟踪输出 可被重定向。通常用来将跟踪输出到一个文件中 "
# BASHOPTS 					当前启用的bash shell选项的列表 "
# BASHPID 					当前bash进程的PID COLUMNS 当前bash shell实例所用终端的宽度 "
# COMP_CWORD 				COMP_WORDS变量的索引值，后者含有当前光标的位置 "
# COMP_LINE 					当前命令行 "
# COMP_POINT 				当前光标位置相对于当前命令起始的索引 "
# COMP_KEY 					用来调用shell函数补全功能的最后一个键 "
# COMP_TYPE 					一个整数值，表示所尝试的补全类型，用以完成shell函数补全 "
# COMP_WORDBREAKS 			Readline库中用于单词补全的词分隔字符 "
# COMP_WORDS 				含有当前命令行所有单词的数组变量 "
# COMPREPLY 					COPROC 含有由shell函数生成的可能填充代码的数组变量 占用未命名的协进程的I/O文件描述符的数组变量 "
# DIRSTACK 					含有目录栈当前内容的数组变量 "
# EMACS 						设置为't'时，表明emacs shell缓冲区正在工作，而行编辑功能被禁止 "
# ENV 						如果设置了该环境变量，在bash shell脚本运行之前会先执行已定义的启动文件（仅 用于当bash shell以POSIX模式被调用时） "
# EUID 						当前用户的有效用户ID（数字形式） "
# FCEDIT 					供fc命令使用的默认编辑器 "
# FIGNORE 					在进行文件名补全时可以忽略后缀名列表，由冒号分隔 "
# FUNCNAME 					当前执行的shell函数的名称  "
# FUNCNEST 				    当设置成非零值时，表示所允许的最大函数嵌套级数（一旦超出，当前命令即被终止）  "
# GLOBIGNORE 				冒号分隔的模式列表，定义了在进行文件名扩展时可以忽略的一组文件名  "
# GROUPS 					含有当前用户属组列表的数组变量  "
# histchars 				    控制历史记录扩展，最多可有3个字符  "
# HISTCMD 				    当前命令在历史记录中的编号  "
# HISTCONTROL 			    控制哪些命令留在历史记录列表中  "
# HISTFILE 				    保存shell历史记录列表的文件名（默认是.bash_history）  "
# HISTFILESIZE 			    HISTTIMEFORMAT 最多在历史文件中存多少行 如果设置了且非空，就用作格式化字符串，以显示bash历史中每条命令的时间戳  "
# HISTIGNORE 				由冒号分隔的模式列表，用来决定历史文件中哪些命令会被忽略  "
# HISTSIZE 				    最多在历史文件中存多少条命令  "
# HOSTFILE 				    shell在补全主机名时读取的文件名称  "
# HOSTNAME 				    当前主机的名称  "
# HOSTTYPE 				    当前运行bash shell的机器  "
# IGNOREEOF 				    shell在退出前必须收到连续的EOF字符的数量（如果这个值不存在，默认是1）  "
# INPUTRC 				    Readline初始化文件名（默认是.inputrc）  "
# LANG 					    shell的语言环境类别 LC_ALL 定义了一个语言环境类别，能够覆盖LANG变量  "
# LC_COLLATE 				设置对字符串排序时用的排序规则  "
# LC_CTYPE 				    决定如何解释出现在文件名扩展和模式匹配中的字符  "
# LC_MESSAGES 			    在解释前面带有\$的双引号字符串时，该环境变量决定了所采用的语言环境设置  "
# LC_NUMERIC 				决定着格式化数字时采用的语言环境设置  "
# LINENO 					当前执行的脚本的行号  "
# LINES 					    定义了终端上可见的行数  "
# MACHTYPE 				    用“CPU?公司?系统”（CPU-company-system）格式定义的系统类型  "
# MAPFILE 				    一个数组变量，当mapfile命令未指定数组变量作为参数时，它存储了mapfile所读入的文本  "
# MAILCHECK 				    shell查看新邮件的频率（以秒为单位，默认值是60）  "
# OLDPWD 					shell之前的工作目录 OPTERR 设置为1时，bash shell会显示getopts命令产生的错误  "
# OSTYPE 					定义了shell所在的操作系统  "
# PIPESTATUS 				含有前台进程的退出状态列表的数组变量  "
# POSIXLY_CORRECT 		    设置了的话，bash会以POSIX模式启动  "
# PPID 					    bash shell父进程的PID PROMPT_COMMAND 设置了的话，在命令行主提示符显示之前会执行这条命令  "
# PROMPT_DIRTRIM 			用来定义当启用了\w或\W提示符字符串转义时显示的尾部目录名的数量。被删除的 目录名会用一组英文句点替换  "
# PS3 					    select命令的提示符   "
# PS4 			            如果使用了bash的-x选项，在命令行之前显示的提示信息 "
# PWD 			            当前工作目录 RANDOM 返回一个0～32767的随机数（对其的赋值可作为随机数生成器的种子） "
# READLINE_LINE 	            当使用bind –x命令时，存储Readline缓冲区的内容 "
# READLINE_POINT 	        当使用bind –x命令时，表示Readline缓冲区内容插入点的当前位置 "
# REPLY 			            read命令的默认变量 "
# SECONDS 		            自从shell启动到现在的秒数（对其赋值将会重置计数器） "
# SHELL 			            bash shell的全路径名 SHELLOPTS 已启用bash shell选项列表，列表项之间以冒号分隔 "
# SHLVL 			            shell的层级；每次启动一个新bash shell，该值增加1 "
# TIMEFORMAT 		        指定了shell的时间显示格式 "
# TMOUT 			            select和read命令在没输入的情况下等待多久（以秒为单位）。默认值为0，表示 无限长 TMPDIR 目录名，保存bash shell创建的临时文件 UID 当前用户的真实用户ID "


# 5. 设置 PATH 环境变量
# PATH中各个目录之间使用冒号分隔的
echo $PATH
PATH=$PATH:/home/ubuntu/Scripts
echo $PATH


# 6. 定位系统环境变量
# 6.1 登录 shell
#   登录Linux系统时，bash shell会作为登录shell启动。会从5个启动文件里读取命令
# /etc/profile                  系统上默认的 bash shell 的主启动文件
# $HOME/.bash_profile
# $HOME/.bashrc
# $HOME/.bash_login
# $HOME/.profile
# 6.2 交互式 shell 进程
#       交互式shell不会访问 /etc/profile 文件，只会检查用户 HOME目录中的 .bashrc文件
# 6.3 非交互式 shell 进程
#       bash shell提供了BASH_ENV环境变量[printenv BASH_ENV]"
# 6.4 环境变量持久化
#       在 /etc/profile.d目录中创建一个以 .sh 结尾的文件。把所有新的或修改过的全局环境变量设置放在这个文件中。
#       存储个人用户永久性 bash shell 变量的地方 $HOME/.bashrc文件中，从而达到永久化。


# 7. 数组变量
# 给某个环境变量设置多个值，可以把值放在括号里，值与值之间用空格分隔
my_test_variable = (one two three four five)
echo $my_test_variable
echo ${my_test_variable[2]}
echo ${my_test_variable[*]}
my_test_variable[2]=2
echo ${my_test_variable[*]}
unset my_test_variable[2]
echo ${my_test_variable[*]}
