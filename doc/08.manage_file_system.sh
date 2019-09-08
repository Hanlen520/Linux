#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第八章 管理文件系统


echo "================================================================================================================="
echo "8.1 探索Linux文件系统"
    echo -e "\t 8.1.1 基本的Linux文件系"
        echo -e "\t\t 1.ext(extend filesystem)文件系统--索引节点系统在每个物理设备中创建一个单独的表来存储文件信息"
        echo -e "\t\t 1.ext2文件系统--增加了访问文件的大小；将磁盘分组减少碎片化，提高访问速度"


    echo -e "\t 8.1.2 日志文件系统---先将更改的文件临时写到临时文件中，数据成功写入存储设备和索引节点之后，再删除对应的日志条目"
        # 数据模式 索引节点和文件都会被写入日志；丢失数据风险低，但性能差
        # 有序模式 只有索引节点数据会被写入日志，但只有数据成功写入后才删除；在性能和安全性之间取得了 良好的折中
        # 回写模式 只有索引节点数据会被写入日志，但不控制文件数据何时写入；丢失数据风险高，但仍比不用 日志好
        echo -e "\t\t 1.ext3文件系统"
        echo -e "\t\t 2.ext4文件系统"
        echo -e "\t\t 3.Reiser文件系统"
        echo -e "\t\t 4.JSF文件系统"
        echo -e "\t\t 5.XFS文件系统"

    echo -e "\t 8.1.3 写时复制文件系统"
        echo -e "\t 1.ZFS文件系统"
        echo -e "\t 2.Btrf文件系统"


echo "================================================================================================================="
echo "8.2 操作文件系统"
    echo -e "\t 8.2.1 创建分区--fdisk工具(ROOT权限)"
        echo -e "\t\t fdisk命令"
        echo -e "\t\t a 设置活动分区标志 "
        echo -e "\t\t b 编辑BSD Unix系统用的磁盘标签 "
        echo -e "\t\t c 设置DOS兼容标志 "
        echo -e "\t\t d 删除分区 "
        echo -e "\t\t l 显示可用的分区类型"
        echo -e "\t\t m 显示命令选项"
        echo -e "\t\t n 添加一个新分区"
        echo -e "\t\t o 创建DOS分区表"
        echo -e "\t\t p 显示当前分区表"
        echo -e "\t\t q 退出，不保存更改"
        echo -e "\t\t s 为Sun Unix系统创建一个新磁盘标签"
        echo -e "\t\t t 修改分区的系统ID"
        echo -e "\t\t u 改变使用的存储单位 "
        echo -e "\t\t v 验证分区表 "
        echo -e "\t\t w 将分区表写入磁盘 "
        echo -e "\t\t x 高级功能 "

    echo -e "\t 8.2.2 创建文件系统---将文件存储到分区之前必须用某种文件系统进行格式化，Linux才能使用它"
        echo -e "\t\t 创建文件系统的命令行程序 "
        echo -e "\t\t mkefs       创建一个ext文件系统  "
        echo -e "\t\t mke2fs      创建一个ext2文件系统  "
        echo -e "\t\t mkfs.ext3   创建一个ext3文件系统  "
        echo -e "\t\t mkfs.ext4   创建一个ext4文件系统  "
        echo -e "\t\t mkreiserfs  创建一个ReiserFS文件系统  "
        echo -e "\t\t jfs_mkfs    创建一个JFS文件系统  "
        echo -e "\t\t mkfs.xfs    创建一个XFS文件系统  "
        echo -e "\t\t mkfs.zfs    创建一个ZFS文件系统  "
        echo -e "\t\t mkfs.btrfs  创建一个Btrfs文件系统  "

        type mkfs.ext4  # 查看某个文件系统是否可用
        # mkdir命令（参见第3章）在虚拟目录中创建了挂载点，mount命令将新的硬盘分区添加到挂 载点。
        # mount命令的-t选项指明了要挂载的文件系统类型（ext4）。

    echo -e "\t 8.2.3 文件系统的检查与修复--fsck命令能够检查和修复大部分类型的Linux文件系统"
        echo -e "\t\t fsck的命令行选项 "
        echo -e "\t\t -a 如果检测到错误，自动修复文件系统  "
        echo -e "\t\t -A 检查/etc/fstab文件中列出的所有文件系统  "
        echo -e "\t\t -C 给支持进度条功能的文件系统显示一个进度条（只有ext2和ext3） "
        echo -e "\t\t -N 不进行检查，只显示哪些检查会执行  "
        echo -e "\t\t -r 出现错误时提示  "
        echo -e "\t\t -R 使用-A选项时跳过根文件系统  "
        echo -e "\t\t -s 检查多个文件系统时，依次进行检查  "
        echo -e "\t\t -t 指定要检查的文件系统类型  "
        echo -e "\t\t -T 启动时不显示头部信息  "
        echo -e "\t\t -V 在检查时产生详细输出  "
        echo -e "\t\t -y 检测到错误时自动修复文件系统  "


echo "================================================================================================================="
echo "8.3 逻辑卷管理---通过将另外一个硬盘上的分区加入已有文件系统，动态地添加存储空间（解决一块硬盘空间有限的问题）"
    echo -e "\t 8.3.1 逻辑卷管理布局【硬盘为物理卷PV；多个物理卷形成卷组VG；整个系统的最后一层是逻辑卷LV】"

    echo -e "\t 8.3.2 Linux中的LVM"
        echo -e "\t\t 1.快照：Linux LVM允许你在逻辑卷在线的状态下将其复制到另一个设备"
        echo -e "\t\t 2.条带化：可跨多个物理硬盘 创建逻辑卷"
        echo -e "\t\t 3.镜像：涉及大量数据变动的，镜像是一个实时更新的逻辑卷的完整副本"

    echo -e "\t 8.3.3 使用Linux LVM"
        echo -e "\t\t 1.定义物理卷--
                a.将硬盘上的物理分区转换成Linux LVM使用的物理卷区段，fdisk命令;
                b.用分区来创建实际的物理卷，pvcreate命令；
                c.查看创建进度的话，用pvdisplay命令"

        echo -e "\t\t 2. 创建卷组--
                 a.从命令行创建卷组，需要使用vgcreate命令;
                 b.看新创建的卷组的细节，可用vgdisplay命令"

        echo -e "\t\t 3. 创建逻辑卷--要创建逻辑卷，使用lvcreate命令"
                # -c --chunksize 指定快照逻辑卷的单位大小
                # -C --contiguous 设置或重置连续分配策略
                # -i --stripes 指定条带数
                # -I --stripesize 指定每个条带的大小
                # -l --extents 指定分配给新逻辑卷的逻辑区段数，或者要用的逻辑区段的百分比
                # -L --size 指定分配给新逻辑卷的硬盘大小
                # --minor 指定设备的次设备号
                # -m --mirrors 创建逻辑卷镜像
                # -M --persistent 让次设备号一直有效
                # -n --name 指定新逻辑卷的名称
                # -p --permission 为逻辑卷设置读/写权限
                # -r --readahead 设置预读扇区数
                # -R --regionsize 指定将镜像分成多大的区
                # -s snapshot 创建快照逻辑卷
                # -Z --zero 将新逻辑卷的前1 KB数据设置为零

echo -e "\t\t 4. 创建文件系统 "

        echo -e "\t\t 5. 修改LVM "
            echo -e "\t\t\t Linux LVM命令 "
            echo -e "\t\t\t vgchange 激活和禁用卷组  "
            echo -e "\t\t\t vgremove 删除卷组  "
            echo -e "\t\t\t vgextend 将物理卷加到卷组中  "
            echo -e "\t\t\t vgreduce 从卷组中删除物理卷  "
            echo -e "\t\t\t lvextend 增加逻辑卷的大小  "
            echo -e "\t\t\t lvreduce 减小逻辑卷的大小  "