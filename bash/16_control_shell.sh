#!/usr/bin/env bash
# @File    :   16_control_shell.sh
# @Time    :   2019/9/20 12:51
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   None


# ==============================================================================
#   Linux利用信号与运行在系统中的进程进行通信。
#   可以通过对脚本进行编程，使其在收到特定信号时执行某些命令，从而控制shell脚本的操作。
# 1. 处理信号
#  1.1 Linux信号
#       1       SIGHUP      挂起进程
#       2       SIGINT      终止进程
#       3       SIGQUIT     停止进程
#       9       SIGKILL     无条件终止进程
#       15      SIGTERM     尽可能终止进程
#       17      SIGSTOP     无条件停止进程，但不是终止进程
#       18      SIGTSTP     停止或暂停进程，但不终止进程
#       19      SIGCONT     继续运行停止的进程
# 1.2 生成信号
#   （1）终端进程 --- Ctrl+C组合键会生成SIGINT信号
#   （2）暂停进程 --- Ctrl+Z组合键会生成一个SIGTSTP信号
# 1.3 捕获信号
#   trap命令允许你来指定shell脚本要监看并从shell中拦截的Linux信号
#   脚本收到了trap命令中列出的信号，该信号不再由shell处理，而是交由本地处理
$ cat test1.sh
#!/bin/bash
# Testing signal trapping
#
trap "echo ' Sorry! I have trapped Ctrl-C'" SIGINT
#
echo This is a test script
#
count=1
while [[ ${count} -le 10 ]]
do
 echo "Loop #$count"
 sleep 1
 count=$[ $count + 1 ]
done
#
trap "echo ' I modified the trap!'" SIGINT
#
count=1
while [[ ${count} -le 5 ]]
do
     echo "Second Loop #$count"
     sleep 1
     count=$[ ${count} + 1 ]
done
echo "This is the end of the test script"
# 1.4 捕获脚本退出
#   在shell脚本中捕获信号，你也可以在shell脚本退出时进行捕获
#   要捕获shell脚本的退出，只要在trap命令后加上EXIT信号就行
trap "echo Goodbye..." EXIT
count=1
while [[ ${count} -le 5 ]]
do
    echo "Loop #${count}"
    sleep 1
    count=$[ ${count} + 1 ]
done
# 1.5 修改或移除捕获
#   修改了信号捕获之后，脚本处理信号的方式就会发生变化。但如果一个信号是在捕获被修改前接收到的，
#   那么脚本仍然会根据最初的trap命令进行处理
$ cat test1615.sh
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
num=1
while [[ ${num} -le 5 ]]
do
    echo "Loop #${num}"
    sleep 1
    num=$[ ${num} + 1 ]
done
# 设置好的捕获。只需要在trap命令与希望恢复默认行为的信号列表之间加上两个破折号就行了
$ cat test3b.sh
#!/bin/bash
# Removing a set trap
#
trap "echo ' Sorry... Ctrl-C is trapped.'" SIGINT
#
count=1
while [[ $count -le 5 ]]
do
 echo "Loop #$count"
 sleep 1
 count=$[ $count + 1 ]
done
#
# Remove the trap
trap -- SIGINT
echo "I just removed the trap"
#
count=1
while [[ ${count} -le 5 ]]
do
 echo "Second Loop #$count"
 sleep 1
 count=$[ $count + 1 ]
done
# ==============================================================================
# 2. 以后台模式运行脚本
#   在后台模式中，进程运行时不会和终端会话上的STDIN、STDOUT以及STDERR关联
# 2.1 后台运行脚本
#       &  ---  以后台模式运行shell脚本
$ cat test1621.sh
num21=1
while [[ ${num21} -le 10 ]]
do
    sleep 1
    count=$[ ${count} + 1 ]
done
$ ./test1621.sh
# 2.2 运行多个后台作业
$ ./test1622.sh &
$ ./test16221.sh &
$ ./test16222.sh &
#   每次启动新作业时，Linux系统都会为其分配一个新的作业号和PID
#   ps命令，可以看到所有脚本处于运行状态
#   如果终端会话退出，那么后台进程也会随之退出。


# ==============================================================================
# 3. 在非控制台下运行脚本
#   让脚本一直以后台模式运行到结束，即使你退出了终端会话
#   nohup命令运行了另外一个命令来阻断所有发送给该进程的SIGHUP信号
#   由于nohup命令会解除终端与进程的关联，进程也就不再同STDOUT和STDERR联系在一起
#   为了保存该命令产生的输出，nohup命令会自动将STDOUT和STDERR的消息重定向到一个名为nohup.out的文件中。
nohup ./test.sh &

# ==============================================================================
# 4. 作业控制
#   启动、停止、终止以及恢复作业的这些功能统称为作业控制。
#   通过作业控制，就能完全控制 shell 环境中所有进程的运行方式了
# 4.1 查看作业
#   jobs命令参数
#       -l 列出进程的PID以及作业号
#       -n 只列出上次shell发出的通知后改变了状态的作业
#       -p 只列出作业的PID
#       -r 只列出运行中的作业
#       -s 只列出已停止的作业
$ cat test10.sh
#!/bin/bash
# Test job control
echo "Script Process ID: $$"
count=1
while [[ ${count} -le 10 ]]
do
     echo "Loop #$count"
     sleep 10
     count=$[ $count + 1 ]
done
echo "End of script..."

$ ./test10.sh
$ Ctrl-z
$ jobs
$ ./test10.sh > test10.out &
$ job -l
# -----------------------------------------------------------------------------
# 4.2 重启停止的作业
#   可以将已停止的作业作为后台进程或前台进程重启
#   bg命令+作业号  --  就可以将其以后台模式重启
#   fg命令+作业号  --  以前台模式重庆作业


# ==============================================================================
# 5.调整谦让度
#   调度优先级（scheduling priority）是内核分配给进程的CPU时间（相对于其他进程）
#   调度优先级是个整数值，从20（最高优先级）到+19（最低优先级）
#   bash shell以优先级0来启动所有进程
# 5.1 nice命令
#       -n      指定新的优先级级别
#       -n选项并不是必须的，只需要在破折号后面跟上优先级就行了
nice -n 10 ./test4.sh > test4.out &
nice -10 ./test4.sh > test4.out &
ps -p 4993 -o pid,ppid,ni,cmd
# 5.2 renice命令
#       renice      改变系统上已运行命令的优先级, 允许你指定运行进程的PID来改变它的优先级
#        只能对属于你的进程执行renice；
#        只能通过renice降低进程的优先级；
#        root用户可以通过renice来任意调整进程的优先级。
renice -n 10 -p 5055



# ==============================================================================
# 6. 定时运行作业
# 6.1 用 at 命令来计划执行作业
#       at命令允许指定Linux系统何时运行脚本。at命令会将作业提交到队列中，at的守护进程atd会以后台模式运行，检查作业队列来运行作业
#       -f 指明使用那个脚本文件
#       at命令利用sendmail应用程序来发送邮件
#       atq --- 查看系统中有哪些作业在等待： 显示了作业号、系统运行该作业的日期和时间及其所在的作业队列
#       atrm命令+作业号 --- 删除等待中的命令
$ cat test13.sh
#!/bin/bash
# Test using at command
echo "This script ran at $(date +%B%d,%T)"
echo
sleep 5
echo "This is the script's end..."
$ at -f test13.sh now
$ job 7 at 2015-07-14 12:38
$ atq
$ 19 2015-07-14 13:30 a Christine
$ atrm 19
$ atq
# 6.2 安排需要定期执行的脚本
#   cron --- 时间表
15 10 * * * /home/rich/test4.sh > test4out
#   构建cron时间表
cron -l     # 列出已有的cron时间表
#   浏览cron目录
$ sudo cat /etc/anacrontab
# 6.3 使用新的shell启动脚本
#   每次启动一个新shell时，bash shell都会运行.bashrc文件，所以修改.bashrc来定制化提示语
#   .bashrc文件会运行两次：一次是当你登入bash shell时，另一次是当你启动一个bash shell时
