#!/usr/bin/env bash
# @File    :   10_use_editor.sh
# @Time    :   2019/9/15 14:06
# @Author  :   Crisimple
# @Github :    https://crisimple.github.io/
# @Contact :   Crisimple@foxmail.com
# @License :   (C)Copyright 2017-2019, Micro-Circle
# @Desc    :   使用编辑器

# 1. vim编辑器
# 1.1 检查vim软件包
which vim
#   安装 vim
sudo apt install vim

# 1.2 vim基础
# 普通模式：
#   h：左移一个字符
#   j：下移一行（文本中的下一行）
#   k：上移一行（文本中的上一行）
#   l：右移一个字符
#   PageDown（或Ctrl+F）：下翻一屏
#   PageUp（或Ctrl+B）：上翻一屏
#   G：移到缓冲区的后一行
#   num G：移动到缓冲区中的第num行
#   gg：移到缓冲区的第一行
#   q：如果未修改缓冲区数据，退出
#   q!：取消所有对缓冲区数据的修改并退出
#   w filename：将文件保存到另一个文件中
#   wq：将缓冲区数据保存到文件中并退出


# 1.3 编辑数据
# 编辑模式：
#   i 进入文本编辑模式
#   x 删除当前光标所在位置的字符
#   dd 删除当前光标所在行
#   dw 删除当前光标所在位置的单词
#   d$ 删除当前光标所在位置至行尾的内容
#   J 删除当前光标所在行行尾的换行符（拼接行）
#   u 撤销前一编辑命令
#   a 在当前光标后追加数据
#   A 在当前光标所在行行尾追加数据
#   r char 用char替换当前光标所在位置的单个字符
#   R text 用text覆盖当前光标所在位置的数据，直到按下ESC键

# 1.4 复制和粘贴
# yy	复制光标所在的整行
# y{	复制到上一段的开始
# Y 或 y$	复制从光标所在行 行首到行尾的内容
# y}	复制到下一段的开始
# y0	复制从光标前一个字符开始到行首的内容
# y<CR>	复制包括当前行在内的两行内容
# y(	复制到上一句的开始	yw	复制一个单词
# y)	复制到下一句的开始
# p 命令：粘贴命令，粘贴当前缓冲区中的内容。


# 1.5 查找和替换
# :s/old/new/g：一行命令替换所有old。
# :n,ms/old/new/g：替换行号n和m之间所有old。
# :%s/old/new/g：替换整个文件中的所有old。
# :%s/old/new/gc：替换整个文件中的所有old，但在每次出现时提示。‘