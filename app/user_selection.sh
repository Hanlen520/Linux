#!/bin/bash
# by author: Crisimple
# -*- coding: UTF-8 -*-
# description: using select to choose option

function whose_on {
    clear
    echo "在线用户为：" `whoami`
}

function disk_space {
    clear
    echo "设备的磁盘信息：" `df -k`
}

function memory_usage {
    clear
    echo "设备空间信息："  `cat /proc/meminfo`
}

# PS3——Shell脚本中使用select时的提示符
PS3="Enter option:"

select option in "Display logged on users" "Display disk space" "Display memory usage" "Exit program"
do
    case ${option} in
    "Exit program")
        break;;
    "Display logged on users")
        whose_on;;
    "Display disk space")
        disk_space;;
    "Display memory usage")
        memory_usage;;
    *)
        clear
        echo "Sorry, wrong selection"
    esac
done
clear