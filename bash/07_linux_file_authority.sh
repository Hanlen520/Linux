#!/usr/bin/env bash
# @File    :   ${NAME}
# @Time    :   2019/9/14 14:29
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   Linux文件权限

# 1. Linux 的安全性
# (1) /etc/passwd文件  --- 将用户的登录名匹配到对应的UID值
cat /etc/passwd
# mysql:x:113:117:MySQL Server,,,:/nonexistent:/bin/false
# 对应字段的含义分别是：
#       登录用户名
#       用户密码：x --- 代表密码字段
#       用户账户的UID形式
#       用户组的GID形式
#       用户账号的备注
#       用户HOME目录的位置
#       用户的默认 shell
# (2) /etc/shadow文件  --- Linux系统密码管理
sudo cat /etc/shadow
# mysql:!:18144:0:99999:7:::
# 对应字段的含义分别是：
#       与/etc/passwd文件中的登录名字段对应的登录名
#       加密后的密码
#       自上次修改密码后过去的天数密码（自1970年1月1日开始计算）
#       多少天后才能更改密码
#       多少天后必须更改密码
#       密码过期前提前多少天提醒用户更改密码
#       密码过期后多少天禁用用户账户
#       用户账户被禁用的日期（用自1970年1月1日到当天的天数表示）
#       预留字段给将来使用
# (3) useradd  --- 添加新用户
# 系统默认值被设置在/etc/default/useradd文件中。可以使用加入了-D选项的useradd命令查看所用Linux系统中的这些默认值。
/usr/sbin/useradd -D
# 对应字段的含义分别是：
#       新用户会被添加到GID为100的公共组；
#       新用户的HOME目录将会位于/home/loginname；
#       新用户账户密码在过期后不会被禁用；
#       新用户账户未被设置过期日期；
#       新用户账户将bash shell作为默认shell；
#       系统会将/etc/skel目录下的内容复制到用户的HOME目录下；
#       系统为该用户账户在mail目录下创建一个用于接收邮件的文件
# 创建一个新用户账号， 并查看新用户的 HOME 目录
useradd -m test
ls -al /home/test
# useradd 命令行参数
#       -c comment 			给新用户添加备注
#       -d home_dir 		为主目录指定一个名字（如果不想用登录名作为主目录名的话）
#       -e expire_date 		用YYYY-MM-DD格式指定一个账户过期的日期
#       -f inactive_days 	指定这个账户密码过期后多少天这个账户被禁用；0表示密码一过期就立即禁用，1表示 禁用这个功能
#       -g initial_group 	指定用户登录组的GID或组名
#       -G group ... 		指定用户除登录组之外所属的一个或多个附加组
#       -k 					必须和-m一起使用，将/etc/skel目录的内容复制到用户的HOME目录
#       -m 					创建用户的HOME目录
#       -M 					不创建用户的HOME目录（当默认设置里要求创建时才使用这个选项）
#       -n 					创建一个与用户登录名同名的新组
#       -r 		            创建系统账户
#       -p 		            passwd 为用户账户指定默认密码
#       -s 		            shell 指定默认的登录shell
#       -u 		            uid 为账户指定唯一的UID
# useradd 更改默认值的参数
#       -b default_home 		更改默认的创建用户HOME目录的位置
#       -e expiration_date 		更改默认的新账户的过期日期
#       -f inactive 			更改默认的新用户从密码过期到账户被禁用的天数
#       -g group 				更改默认的组名称或GID
#       -s shell 				更改默认的登录shell
# (4) userdel  --- 删除用户
sudo /usr/sbin/userdel test         # 从系统中删除用户
sudo /usr/sbin/userdel -r test      # 删除用户的HOME目录以及邮件目录
# (5) 修改用户信息
# usermod  --- 修改用户
#   usermod 命令行参数
#       -l      修改用户账户的登录名。
#       -L      锁定账户，使用户无法登录。
#       -p      修改账户的密码。
#       -U      解除锁定，使用户能够登录。
# passwd 和 chpasswd --- 修改用户密码
sudo passwd -e test      # -e 参数下次登录时修改密码，只有 root 权限用户才有权限改别人的密码
sudo chpasswd < users.txt    # 修改大量用户的密码（重定向文件的格式：userid:passwd）
# chsh、chfn、chage
#   chsh --- chsh命令用来快速修改默认的用户登录shell
sudo chsh -s /bin/csh test
#   chfn --- 在/etc/passwd文件的备注字段中存储信息的标准方法
sudo chfn test
#   chage --- 帮助管理用户账号的有效期
sudo chage -d 10 test
#       -d 设置上次修改密码到现在的天数
#       -E 设置密码过期的日期
#       -I 设置密码过期到锁定账户的天数
#       -m 设置修改密码之间最少要多少天
#       -W 设置密码过期前多久开始出现提醒信息


# ============================================================================
# 2. Linux 用户组
# (1) /etc/group文件 --- 系统上每个组的信息
grep test /etc/group
# 对应字段的含义分别是：
#       组名
#       组密码
#       GID
#       属于组的用户列表
# (2) 创建新组
# 创建新组时，默认没有用户被分配到该组
sudo /usr/sbin/groupadd test_group
tail /etc/group
# 可以用usermod命令将用户添加到组中; -g 会删除默认组；-G 会保留默认组
sudo /usr/sbin/usermod -G test_group test
tail /etc/group
# (3) 修改组
#   -n      修改组的组名
#   -g      修改组的GID
sudo /usr/sbin/groupmod -n test_group_mod test_group
tail /etc/group


# ============================================================================
# 3. 文件权限
# 3.1 文件权限符
#  第一段字符代表：
#        -  代表文件
#        d  代表目录
#        l  代表链接
#        c  代表字符型设备
#        b  代表块设备
#        n  代表网络设备
#  第二段字符代表，每三段代表对应对象的3个安全级别：
#        r  代表对象是可读的
#        w  代表对象是可写的
#        x  代表对象是可执行的
#   对象的属主
#   对象的属组
#   系统其他用户
# 3.2 默认文件权限
touch new_file
ls -al newfile
# umask命令用来设置所创建文件和目录的默认权限
umask


# ============================================================================
# 4. 更改文件权限
# (1) 改变权限
#   八进制形式权限
chmod 760 newfile
ls -al newfile
#   符合模式权限
#       u --- 用户
#       g --- 用户组
#       o --- 其他用户
#       a --- 代表上面所有
#       + --- 现有权限基础上增加权限
#       - --- 现有权限基础上移除权限
#       = --- 将权限设置成后面的值
#       X：如果对象是目录或者它已有执行权限，赋予执行权限
#       s：运行时重新设置UID或GID
#       t：保留文件或目录
#       u：将权限设置为跟属主一样
#       g：将权限设置为跟属组一样
#       o：将权限设置为跟其他用户一样
chmod u+x newfile
# ----------------------------------------------
# (2) 改变所属关系
# chown命令用来改变文件的属主
sudo touch newfile
ls -al newfile
chown test newfile
ls -al newfile
# chgrp命令用来改变文件的默认属组。
sudo chgrp test_group_mod newfile
ls -al newfile


# ============================================================================
# 5. 共享文件
#   设置用户ID（SUID）：当文件被用户使用时，程序会以文件属主的权限运行。
#   设置组ID（SGID）：对文件来说，程序会以文件属组的权限运行；对目录来说，目录中 创建的新文件会以目录的默认属组作为默认属组。
#   粘着位：进程结束后文件还驻留（粘着）在内存中。
sudo mkdir test_dir
sudo chgrp test test_dir
ls -al test_dir/