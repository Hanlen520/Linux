#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第十六章 控制脚本


#=======================================================================================================================
# 16.1 处理信号
    # 16.1.1 重温Linux信号
        # 信号：1---值：SIGHUP---描述：挂起进程
        # 信号：2---值：SIGINT---描述：终止进程
        # 信号：3---值：SIGQUIT---描述：停止进程
        # 信号：9---值：SIGKILL---描述：无条件终止进程
        # 信号：15---值：SIGTERM---描述：尽可能终止进程
        # 信号：17---值：SIGSTOP---描述：无条件停止进程，但不是终止进程
        # 信号：18---值：SIGTSTP---描述：停止或暂停进程，但不终止进程
        # 信号：19---值：SIGCONT---描述：继续运行停止的进程
        # bash shell会忽略收到的任何SIGQUIT (3)和SIGTERM (15)信号

    # 16.1.2 生成信号
        # 1.中断进程---Ctrl+C组合键会生成SIGINT信号
            sleep 100
        # 2.暂停进程---Ctrl+Z组合键会生成一个SIGTSTP信号，停止shell中运行的任何进，用ps命令来查看已停止的作业。
            sleep 100
            ps -l

    # 16.1.3 捕获信号---trap命令允许你来指定shell 脚本要监看并从shell中拦截的Linux信号[格式：trap commands signals]
        #!/bin/bash
        # by author: Crisimple
        # description: use trap command to catch the 'Ctrl-c' SIGINT signal; trap_command_signal.sh
        #
        trap "echo `Sorry! I have trapped Ctrl-c `" SIGINT
        #
        echo "This is a test script."
        #
        count=1
        while [ ${count} -le 10 ]
        do
            echo "Loop #${count}"
            sleep 1
            count=$[ ${count} + 1 ]
        done
        #
        echo "This is end of the test script."
        #

    # 16.1.4 捕获脚本退出--除了在shell脚本中捕获信号，你也可以在shell脚本退出时进行捕获
        #!/bin/bash
        # by author:Crisimple
        # description: trapping the script exit; trapping_signal_EXIT.sh
        #
        trap "echo GoodBye..." EXIT
        #
        count=1
        while [ ${count} -le 5 ]
        do
            echo "Loop #${count}"
            sleep 1
            count=$[ ${count} + 1 ]
        done
        #

    # 16.1.5 修改或移除捕获---要想在脚本中的不同位置进行不同的捕获处理，只需重新使用带有新选项的trap命令
        #!/bin/bash
        # by author: Crisimple
        # description: use trap command to catch the 'Ctrl-c' SIGINT signal; trap_command_signal.sh
        #
        trap "echo `Sorry! I have trapped Ctrl-c `" SIGINT
        #
        count=1
        while [ ${count} -le 5 ]
        do
            echo "Loop #${count}"
            sleep 1
            count=$[ ${count} + 1 ]
        done
        #
        echo "This is end of the test script."
        #
        trap "echo ' I modified the trap!'" SIGINT
        #
        count=1
        while [ ${count} -le 5 ]
        do
            echo "Second Loop #${count}"
            sleep 1
            count=$[ ${count} + 1 ]
        done
        #以删除已设置好的捕获。只需要在trap命令与希望恢复默认行为的信号列表之间加上 两个破折号就行了。
        # Remove the trap
        trap -- SIGINT
        echo "I just remove the trap"
        #
        count=1
        while [ ${count} -le 5 ]
        do
            echo "Remove Loop #${count}"
            sleep 1
            count=$[ ${count} + 1 ]
        done



# ======================================================================================================================
# 16.2 以后台模式运行脚本---它们在后台运行而不用占用终端会话
    # 16.2.1 后台运行脚本---在命令后加个&符就行了
        # ./test &

    # 16.2.2 运行多个后台作业---也是在命令后加&，同时启用多个
        ps au

    # 16.2.3 退出终端---pts/0


# ======================================================================================================================
# 16.3 在非控制台下运行脚本---在终端会话中启动shell脚本，然后让脚本一直以后台模式运行直到完成，即使退出了终端回话，可用nohup实现
   # 格式： nohup ./test.sh &
   # nohup会从终端解除进程的关联，进程会丢掉STDOUT和STDERR的链接，为保证该命令产生的输出，nohup会自动将STDOUT和STDERR的消息重定向到
   # 一个名为nohup.out的文件中


# ======================================================================================================================
# 16.4 作业控制--启动、停止、无条件终止以及恢复作业的这些功能统称为作业控制
    # 16.4.1 查看作业---jobs命令允许查看shell当前正在处理的作业
        #!/bin/bash
        # by author:
        # description: testing the jobs control;jobs_control.sh
        echo "This is a test program $$"
        count=1
        while [ ${count} -le 10 ]
        do
            echo "Loop #${count}"
            sleep
            count=$[ ${count} + 1 ]
        done
        echo "This is the end of the test program."
        #

        ./jobs_control.sh

        # jobs命令参数
        # -l 列出进程的PID以及作业号     -n 只发出上次shell发出的通知后改变了状态的作业    -p 只列出作业的PID
        # -r 只列出运行中的作业          -s 只列出已停止的作业
        # 带加号的作业会被当做默认作业，带减号的作业会在当前默认作业完成处理时称为下一个默认作业

    # 16.4.2 重启停止的作业---以后台模式重启作业：bg命令 + 作业号------>命令行界面的提示符会出现，允许输入其他命令
    #                    ---以前台模式重启作业：fg命令 + 作业号------>命令行界面的提示符不会出现，直到该作业完成


# ======================================================================================================================
# 16.5 调整谦让度--调度优先级是内核分配给该进程的相对于分配给其他进程的CPU时间总量：-20(最高优先级)----->+20(最低优先级)
    # 16.5.1 nice命令----【创建】启动时调整一个命令的调度优先级，格式：nice -n 10 ./test.sh > testout.txt &
    #                ----nice命令会让脚本以更低的优先级运行，运行上面格式命令回阻止普通用户以高优先级运行运行它的命令


    # 16.5.2 renice命令-----【调整】允许你指定运行进程的PID来改变它的优先级，格式：renice 10 -p 29504
    #        renice命令会有一些限制：
    #·················1.你只能对属于你的进程进行renice
    #·················2.你只能通过renice来降低进程的优先级
    #·················3.root用户可以通过renice来调整任何进程的优先级到任何级别


# ======================================================================================================================
# 16.6 定时作业
    # 16.6.1 用at命令来计划执行作业----允许指定Linux系统何时运行脚本，at的守护atd进程会以后台模式运行，并检查作业队列来运行作业

        # 1.at命令的格式：at [-f filename] time
            # 作业对队列通常用小写字母a~z来引用，字母排序越高，作业运行的优先级越低，如果想更高优先级运行作业，可用-q参数指定对列字母

        # 2.获取作业的输出---Linux系统会将提交该作业的用户的email地址作为STDOUT和STDERR，输出均会通过邮件发送给用户

        # 3.列出等待的作业---atq命令可以查看系统中有哪些作业在等待
            # at -f test.sh 19:00

        # 4.删除作业---atrm命令删除等待中的作业


    # 16.6.2 计划定期执行脚本
        # 1.cron时间表---格式：min hour dayofmonth month dayofweek command
        # 每个月的最后一天执行
        #    00 12 * * * if [ `date +%d -d tomorrow` = 01 ];then:command


        # 2.构建cron时间表
            #···········cron -l  列出已有的时间表
            #···········要为cron时间表条件条目，可以用-e参数


        # 3.cron目录----四个基本目录：hourly、daily、monthly、weekly
        ls /etc/cron.*ly  #如果脚本每天执行的话，就把脚本复制到daily目录下


        # 4.anacron程序-----会回过头运行之前关机时未运行的任务---常规日志维护的脚本




# ======================================================================================================================
# 16.7 启动时运行
    # 16.7.1 开机时运行脚本
        # 1.开机过程---内核加载到内存中并运行
            # System V init过程会读取/etc/inittab文件

    # 16.7.2 在新shell中启动
        # 终端会话在启动时，会检查.bash_profile、.bash_rc两个文件
        # .bash_profile针对所有用户
        # .bash_rc针对当前用户
