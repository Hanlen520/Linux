#!/usr/bin/env bash
# @File    :   03_bash_shell.sh
# @Time    :   2019/9/13 11:41
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   更多 Bash Shell


# 1. 检测程序
# 1.1 探测进程
    # 显示进程之间的层次信息
    ps --forest
    # 显示系统上的进程，并扩展输出
    ps -ef
    # 显示帮助信息
    ps --help
    # 显示调试信息
    ps --info
    # 显示 ps 程序的版本
    ps --version
    # 显示所有进程并进行过滤显示
    ps -aux | grep PID
    # 长格式输出，长格式输出的各参数的含义
    ps -l
    #       F：内核分配给进程的系统标记
    #       S：进程状态【O-正在进行；S-休眠；R-可运行，正在等待；Z-进程僵化；T-停止】
    #       PRI：进程的优先级（越大的数字代表越低的优先级）
    #       NI：谦让度值用来参与决定优先级
    #       ADDR：进程的内存地址
    #       SZ：假如进程被换出，所需交换空间的大致大小
    #       WCHAN：进程休眠的内核函数的地址

# 1.2 实时监测进程
    # 显示实时进程的概要信息
    top
    #   top 输出列表字段信息含义
    #   PID：进程的ID
    #   USER：进程属主的名字
    #   PR：进程的优先级
    #   NI：进程的谦让度值
    #   VIRT：进程占用的虚拟内存的总量
    #   RES：进程占用的物理内存总量
    #   SHR：进程和其他进程共享的内存总量
    #   S：进程的状态【D-休眠状态；R-运行状态；S-休眠状态；T-停止状态；Z-僵化状态】
    #   %CPU：进程使用的CPU时间比例
    #   %MEM：进程使用的内存占可用内存的比例
    #   TIME+：自进程启动到目前为止的CPU时间总量
    #   COMMAND：进程所对应的命令行名称，也就是启动的程序名
        # 在 top 实时监测可使用的命令
        t       # 切换到 cpu 信息行显示
        o       # 更改信息列的显示顺序
        k       # 杀死特定的进程
        q       # 退出 top 命令

# 1.3 结束进程
    # kill 命令
    kill PID
    # 如果要强制终止，-s参数支持指定其他信号（用信号名或信号值）
    kill -s HUP PID
    # killall 命令
    kill "进程名(支持通配符，如：http*)"


# 2. 检测磁盘空间
# 2.1 挂载存储媒体
    # 显示当前系统挂载的设备列表
    mount
    # type参数指定了磁盘被格式化的文件系统类型(vfat/ntfs/iso9660)
    mount -t type device directory
    # mount 挂载参数详解
        # -a 挂载/etc/fstab文件中指定的所有文件系统  "
        # -f 使mount命令模拟挂载设备，但并不真的挂载 "
        # -F 和-a参数一起使用时，会同时挂载所有文件系统 "
        # -v 详细模式，将会说明挂载设备的每一步 "
        # -I 不启用任何/sbin/mount.filesystem下的文件系统帮助文件 "
        # -l 给ext2、ext3或XFS文件系统自动添加文件系统标签 "
        # -n 挂载设备，但不注册到/etc/mtab已挂载设备文件中 "
        # -p num 进行加密挂载时，从文件描述符num中获得密码短语 "
        # -s 忽略该文件系统不支持的挂载选项 "
        # -r 将设备挂载为只读的 "
        # -w 将设备挂载为可读写的（默认参数） "
        # -L label 将设备按指定的label挂载 "
        # -U uuid 将设备按指定的uuid挂载 "
        # -O 和-a参数一起使用，限制命令只作用到特定的一组文件系统上 "
        # -o 给文件系统添加特定的选项 "
    # umount命令 umount命令支持通过设备文件或者是挂载点来指定要卸载的设备。如果有任何程序正在使用设备上的文件，系统就不会允许你卸载它
    umount [directory | device ]
    # 如果在卸载设备时，系统提示设备繁忙，无法卸载设备，通常是有进程还在访问该设备或使用该设备上的文件。这时可用lsof命令获得使用它的进程信息，然后在应用中停止使用该设备或停止该进程。
    lsof /path/to/device/node
    # 或者
    lsof /path/to/mount/point

# 2.2 使用 df 命令
    # df

# 2.3 使用 du 命令


# 3. 处理数据文件