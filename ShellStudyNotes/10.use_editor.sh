#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: 第十章 使用编辑器

echo "================================================================================================================="
echo "10.1 vim编辑器"
    echo -e "\t 10.1.1 检查vim软件包"
        which vim
        ls -l /usr/bin/vim
        ls -l /etc/alternatives/vi
        ls -l /usr/bin/vim.tiny
        readlink -f /usr/bin/v

        # Ubuntu发行版中安装基础版的vim包：sudo apt-get install vim


    echo -e "\t 10.1.2 vim基础 "
        # vim编辑器有两种操作模式：
        #  普通模式--要退出插入模式回到普通模式，按下键盘上的退出键（ESC键，也就是Escape键）
            #  h：左移一个字符。  j：下移一行（文本中的下一行）。  k：上移一行（文本中的上一行）。  l：右移一个字符。
            #  PageDown（或Ctrl+F）：下翻一屏。  PageUp（或Ctrl+B）：上翻一屏。  G：移到缓冲区的后一行。
            #  num G：移动到缓冲区中的第num行。  gg：移到缓冲区的第一行。

        # 普通模式下的命令行模式
            #  q：如果未修改缓冲区数据，退出。  q!：取消所有对缓冲区数据的修改并退出。
            #  w filename：将文件保存到另一个文件中。  wq：将缓冲区数据保存到文件中并退出。

        #  插入模式--按下i键就可以进 入插入模式

    echo -e "\t 10.1.3 编辑数据--在普通模式下，vim编辑器提供了一些命令来编辑缓冲区中的数据 "
        echo -e "\t\t x 			删除当前光标所在位置的字符 "
        echo -e "\t\t dd 			删除当前光标所在行 "
        echo -e "\t\t dw 			删除当前光标所在位置的单词 "
        echo -e "\t\t d$ 			删除当前光标所在位置至行尾的内容 "
        echo -e "\t\t J 			删除当前光标所在行行尾的换行符（拼接行） "
        echo -e "\t\t u 			撤销前一编辑命令 "
        echo -e "\t\t a 			在当前光标后追加数据 "
        echo -e "\t\t A 			在当前光标所在行行尾追加数据 "
        echo -e "\t\t r char 		用char替换当前光标所在位置的单个字符 "
        echo -e "\t\t R text 		用text覆盖当前光标所在位置的数据，直到按下ESC键 "


    echo -e "\t 10.1.4 复制和粘贴  "

    echo -e "\t 10.1.5 查找和替换  "
        # :s/old/new/g：一行命令替换所有old。
        # :n,ms/old/new/g：替换行号n和m之间所有old。
        # :%s/old/new/g：替换整个文件中的所有old。
        # :%s/old/new/gc：替换整个文件中的所有old，但在每次出现时提示。‘
        # 查找使用/
