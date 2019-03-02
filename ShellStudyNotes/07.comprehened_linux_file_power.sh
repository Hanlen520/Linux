#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description:  第七章 理解Linux文件权限

echo "================================================================================================================="
echo "7.1 Linux的安全性"
    echo -e "\t 7.1.1 /etc/passwd文件"
        # cat /etc/passwd
        # mysql:x:27:27:MySQL Server:/var/lib/mysql:/bin/bash
        #  登录用户名
        #  用户密码
        #  用户账户的UID（数字形式）
        #  用户账户的组ID（GID）（数字形式）
        #  用户账户的文本描述（称为备注字段）
        #  用户HOME目录的位置 ? 用户的默认shell

    echo -e "\t 7.1.2 /etc/shadow文件--root用户才能访问 "
        # cat /etc/shadow
        # rich:$1$.FfcK0ns$f1UgiyHQ25wrB/hykCn020:11627:0:99999:7:::
        #  与/etc/passwd文件中的登录名字段对应的登录名
        #  加密后的密码
        #  自上次修改密码后过去的天数密码（自1970年1月1日开始计算）
        #  多少天后才能更改密码
        #  多少天后必须更改密码
        #  密码过期前提前多少天提醒用户更改密码
        #  密码过期后多少天禁用用户账户
        #  用户账户被禁用的日期（用自1970年1月1日到当天的天数表示）
        #  预留字段给将来使用


    echo -e "\t 7.1.3 添加新用户--工具是useradd "
        echo -e "\t\t 查看useradd的系统默认值用-D参数"
            /usr/sbin/useradd -D
        # ? 新用户会被添加到GID为100的公共组；
        # ? 新用户的HOME目录将会位于/home/loginname；
        # ? 新用户账户密码在过期后不会被禁用；
        # ? 新用户账户未被设置过期日期；
        # ? 新用户账户将bash shell作为默认shell；
        # ? 系统会将/etc/skel目录下的内容复制到用户的HOME目录下；
        # ? 系统为该用户账户在mail目录下创建一个用于接收邮件的文件
        echo -e "\t\t useradd命令行参数 "
        echo -e "\t\t  -c comment 			给新用户添加备注"
        echo -e "\t\t  -d home_dir 		    为主目录指定一个名字（如果不想用登录名作为主目录名的话）"
        echo -e "\t\t  -e expire_date 		用YYYY-MM-DD格式指定一个账户过期的日期"
        echo -e "\t\t  -f inactive_days 	指定这个账户密码过期后多少天这个账户被禁用；0表示密码一过期就立即禁用，1表示 禁用这个功能"
        echo -e "\t\t  -g initial_group 	指定用户登录组的GID或组名"
        echo -e "\t\t  -G group ... 		指定用户除登录组之外所属的一个或多个附加组"
        echo -e "\t\t  -k 					必须和-m一起使用，将/etc/skel目录的内容复制到用户的HOME目录"
        echo -e "\t\t  -m 					创建用户的HOME目录"
        echo -e "\t\t  -M 					不创建用户的HOME目录（当默认设置里要求创建时才使用这个选项）"
        echo -e "\t\t  -n 					创建一个与用户登录名同名的新组"
        echo -e "\t\t  -r 		            创建系统账户 "
        echo -e "\t\t  -p 		            passwd 为用户账户指定默认密码 "
        echo -e "\t\t  -s 		            shell 指定默认的登录shell "
        echo -e "\t\t  -u 		            uid 为账户指定唯一的UID "

        echo -e "\t\t useradd更改默认值的参数 "
        echo -e "\t\t -b default_home 		更改默认的创建用户HOME目录的位置 "
        echo -e "\t\t -e expiration_date 		更改默认的新账户的过期日期 "
        echo -e "\t\t -f inactive 			更改默认的新用户从密码过期到账户被禁用的天数 "
        echo -e "\t\t -g group 				更改默认的组名称或GID "
        echo -e "\t\t -s shell 				更改默认的登录shell "
        # useradd -D -s /bin/tsch

    echo -e "\t 7.1.4 删除用户--工具是userdel "
    # /usr/sbin/userdel test    从系统中删除用户
    # /usr/sbin/userdel -r test     删除用户的HMOE目录以及邮件目录

    echo -e "\t 7.1.5 修改用户"
        echo -e "\t\t               用户账户修改工具 "
        echo -e "\t\t usermod 	    修改用户账户的字段，还可以指定主要组以及附加组的所属关系 "
        echo -e "\t\t passwd 		修改已有用户的密码 "
        echo -e "\t\t chpasswd 	    从文件中读取登录名密码对，并更新密码 "
        echo -e "\t\t chage 		修改密码的过期日期 "
        echo -e "\t\t chfn 		    修改用户账户的备注信息 "
        echo -e "\t\t chsh 		    修改用户账户的默认登录shell "

echo "================================================================================================================="
echo "7.2 使用Linux组 "
    echo -e "\t 7.2.1 /etc/group文件"
        cat /etc/group
        # ? 组名
        # ? 组密码
        # ? GID
        # ? 属于该组的用户列表

    echo -e "\t 7.2.2 创建新组--groupadd命令可在系统上创建新组，默认没有用户被分配到该组-G会把这个新组添加到该用户账户的组列表里"
        # /usr/sbin/groupadd shared
        # tail /etc/group
        # /usr/sbin/usermod -G shared rich
        # /usr/sbin/usermod -G shared test

    echo -e "\t7.2.3 修改组--groupmod命令可以修改已有组的 GID（加-g选项）或组名（加-n选项）"
        # /usr/sbin/groupmod -n sharing shared
        # tail /etc/group


echo "================================================================================================================="
echo "7.3 理解文件权限 "
    echo -e "\t 7.3.1 使用文件权限符"
        echo -e "\t\t 第一个字段：? -代表文件 ? d代表目录 ? l代表链接 ? c代表字符型设备 ? b代表块设备 ? n代表网络设备"
        echo -e "\t\t 三种访问权限：? r代表对象是可读的 ? w代表对象是可写的 ? x代表对象是可执行的 "
        echo -e "\t\t 三个安全级别：? 对象的属主 ? 对象的属组 ? 系统其他用户  "

    echo -e "\t 7.3.2 默认文件权限-touch命令用分配给我的用户账户的默认权限创建了这个文件。umask命令可以显示和设置 这个默认权限"
        touch newfile
        ls -al newfile
        umask


echo "================================================================================================================="
echo "7.4 改变安全性设置"
    echo -e "\t 7.4.1 改变权限--chmod命令用来改变文件和目录的安全性设置：chmod 760 newfile "
        # 第一组字符定义了权限作用的对象:
            # ? u代表用户 ? g代表组 ? o代表其他 ? a代表上述所有
        # 赋予权限的字符
            # ? X：如果对象是目录或者它已有执行权限，赋予执行权限。 ? s：运行时重新设置UID或GID。
            # ? t：保留文件或目录。 ? u：将权限设置为跟属主一样。 ? g：将权限设置为跟属组一样。 ? o：将权限设置为跟其他用户一样


    echo -e "\t 7.4.2 改变所属关系--：chown命令用来改变文件的属主， chgrp命令用来改变文件的默认属组"


echo "================================================================================================================="
echo "7.5 共享文件"
    #Linux还为每个文件和目录存储了3个额外的信息位。
    #? 设置用户ID（SUID）：当文件被用户使用时，程序会以文件属主的权限运行。
    #? 设置组ID（SGID）：对文件来说，程序会以文件属组的权限运行；对目录来说，目录中 创建的新文件会以目录的默认属组作为默认属组。
    #? 粘着位：进程结束后文件还驻留（粘着）在内存中。
