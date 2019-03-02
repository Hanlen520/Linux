#!/bin/bash
# by author: Crisimple
# description: graphical shell program

#============================================================================================================
# 18.1 创建文本菜单
    # 18.1.1 创建菜单布局
        #!/bin/bash
        # by author: Crisimple
        # description: create your menu layout
        clear
        echo -e "\t\t Sys Admin Menu\n"
        echo -e "\t 1.Display disk place: "
        echo -e "\t 2.Display logged on users: "
        echo -e "\t 3.Display memory usage: "
        echo -e "\t 0.Exit menu \n"
        echo -en "\t\t Enter option: "
        # read命令中用了-n选项来限制只读取一个字符。这样用户只需要输入一个 数字，也不用按回车键
        read -n 1 option

    # 18.1.2 创建菜单函数
        # 先创建一个桩函数（stub function）。桩函数是一个空函数
        function diskspace{
            clear
            echo "This is where the diskspace commands will go..."
        }

        # 主要是为了提高复用性
        function menu{
            clear
            echo
            echo -e "\t\t Sys Admin Menu\n"
            echo -e "\t 1.Display disk place: "
            echo -e "\t 2.Display logged on users: "
            echo -e "\t 3.Display memory usage: "
            echo -e "\t 0.Exit menu \n"
            echo -en "\t\t Enter option: "
        }

    # 18.1.3 添加菜单逻辑
        menu
        case ${option} in
        0)
            break;;
        1)
            diskspace;;
        2)
            whoseon;;
        3)
            menusage;;
        *)
            clear
            echo "Sorry, wrong selection."
        esac

    # 18.1.4 整合shell脚本菜单
        #!/bin/bash
        # by author: Crisimple
        # description: make shell script menu together

        function diskspace{
            clear
            df -k
        }

        function whoseon{
            clear
            who
        }

        function menusage{
            clear
            cat /proc/meminfo
        }

        function menu{
            clear
            echo
            echo -e "\t\t Sys Admin Menu\n"
            echo -e "\t 1.Display disk place: "
            echo -e "\t 2.Display logged on users: "
            echo -e "\t 3.Display memory usage: "
            echo -e "\t 0.Exit menu \n"
            echo -en "\t\t Enter option: "
            read -n 1 option
        }

        while [1]
        do
            menu
            case ${option} in
            0)
                break;;
            1)
                diskspace;;
            2)
                whoseon;;
            3)
                menusage;;
            *)
                clear
                echo "Sorry, wrong selection."
            esac
            echo -en "\n\n\t\t\tHit any key to continue"
            read -n 1 line
        done
        clear

    # 18.1.5 使用select 命令
        PS3="Enter option: "
        select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
        do
            menu
            case ${option} in
            0)
                break;;
            1)
                diskspace;;
            2)
                whoseon;;
            3)
                menusage;;
            *)
                clear
                echo "Sorry, wrong selection."
            esac
            echo -en "\n\n\t\t\tHit any key to continue"
            read -n 1 line
        done
        clear

#============================================================================================================
# 18.2 制作窗口
    # 18.2.1 dialog包---要在命令行上指定某个特定的部件，需使用双破折线格式。
        # 格式：dialog --widget（部件名） parameters（窗口大小及部件文本）
        # 1. msgbox部件
        # 2. yesno部件
        # 3. inputbox部件
        # 4. textbox部件
        # 5. menu部件
        # 6. fselect部件

    # 18.2.2 dialog选项

    # 18.2.3 在脚本中使用 dialog 命令

#============================================================================================================
# 18.3 使用图形
    # 18.3.1 KDE环境

    # 18.3.2 GNOME环境