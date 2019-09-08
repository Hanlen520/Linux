#!/bin/bash
# -*- coding: utf-8 -*-
# by author: Crisimple
# description: ������ ʹ��Linux��������

echo "================================================================================================================="
echo "6.1 ʲô�ǻ������� -- �洢�й�shell�Ự�͹�����������Ϣ"
    echo "\t 6.1.1 ȫ�ֻ�������---ʹ��ȫ��д��ĸ���鿴ȫ�ֱ�����printenv"
        printenv
        # ��ʾ�����ϵͳ��������
        printenv HOME
        echo $HOME
        ls $HOME

    echo "\t 6.1.2 �ֲ���������---set����鿴���л����������ֲ� + ȫ�� + �û��������"


echo "================================================================================================================="
echo "6.2 �����û��������"
    echo -e "\t 6.2.1 ���þֲ��û��������"
        my_variable="this is my variable"
        echo ${my_variable}
        # �˳��ӽ��̣��ֲ������Ͳ�������
#        bash
#        my_child_variable="Hello, I am child process"
#        echo ${my_child_variable}
#        exit
        echo ${my_child_variable}

    echo -e "\t 6.2.2 ����ȫ�ֻ�������"
        my_global="I am global variable"
        export my_global
        echo ${my_global}
#        bash
#        echo ${my_global}
#        my_global="I am child process, I will change my value, in child process, I am changed, but in father process..."
#        export my_global
#        echo ${my_global}
#        exit
        echo ${my_global}




echo "================================================================================================================="
echo "6.3 ɾ����������"
    my_unset_variable="I am Global now"
    echo ${my_unset_variable}



echo "================================================================================================================="
echo "6.4 Ĭ�ϵ�shell��������"

    echo "\t bash shell֧�ֵ�Bourne���� "
    echo "\t CDPATH    	ð�ŷָ���Ŀ¼�б���Ϊcd���������·�� "
    echo "\t HOME 		��ǰ�û�����Ŀ¼ "
    echo "\t IFS 		shell�������ı��ַ����ָ���ֶε�һϵ���ַ� "
    echo "\t MAIL 		��ǰ�û��ռ�����ļ�����bash shell��������ļ���������û�����ʼ��� "
    echo "\t MAILPATH 	ð�ŷָ��ĵ�ǰ�û��ռ�����ļ����б�bash shell�����б��е�ÿ���ļ���������û�����ʼ��� "
    echo "\t OPTARG 		getopts���������һ��ѡ�����ֵ "
    echo "\t OPTIND 		getopts���������һ��ѡ������������� "
    echo "\t PATH 		shell���������Ŀ¼�б���ð�ŷָ� "
    echo "\t PS1 		shell�����н��������ʾ�� "
    echo "\t PS2 		shell�����н���Ĵ���ʾ��  "

    echo "\t bash shell�������� "
    echo "\t BASH 						��ǰshellʵ����ȫ·���� "
    echo "\t BASH_ALIASES 				���е�ǰ�����ñ����Ĺ������� "
    echo "\t BASH_ARGC 					���д����Ӻ�����shell�ű��Ĳ���������������� "
    echo "\t BASH_ARCV 					���д����Ӻ�����shell�ű��Ĳ������������ "
    echo "\t BASH_CMDS 					�������飬����shellִ�й������������λ�� "
    echo "\t BASH_COMMAND 				shell����ִ�е���������Ͼ�ִ�е����� "
    echo "\t BASH_ENV 					�����˵Ļ���ÿ��bash�ű���������ǰ�ȳ������иñ�������������ļ� "
    echo "\t BASH_EXECUTION_STRING  	ʹ��bash -cѡ��ݹ��������� "
    echo "\t BASH_LINENO 				���е�ǰִ�е�shell������Դ�����кŵ�������� "
    echo "\t BASH_REMATCH 				ֻ�����飬��ʹ��������ʽ�ıȽ������=~���п϶�ƥ�䣨positive match��ʱ�� ������ƥ�䵽��ģʽ����ģʽ B "
    echo "\t ASH_SOURCE 				���е�ǰ����ִ�е�shell��������Դ�ļ������������ "
    echo "\t BASH_SUBSHELL 				��ǰ��shell������Ƕ�׼��𣨳�ʼֵ��0�� "
    echo "\t BASH_VERSINFO 				���е�ǰ���е�bash shell�����汾�źʹΰ汾�ŵ�������� "
    echo "\t BASH_VERSION 				��ǰ���е�bash shell�İ汾�� "
    echo "\t BASH_XTRACEFD 				�����ó�����Ч���ļ���������0��1��2������'set -x'����ѡ�����ɵĸ������ �ɱ��ض���ͨ�����������������һ���ļ��� "
    echo "\t BASHOPTS 					��ǰ���õ�bash shellѡ����б� "
    echo "\t BASHPID 					��ǰbash���̵�PID COLUMNS ��ǰbash shellʵ�������ն˵Ŀ�� "
    echo "\t COMP_CWORD 				COMP_WORDS����������ֵ�����ߺ��е�ǰ����λ�� "
    echo "\t COMP_LINE 					��ǰ������ "
    echo "\t COMP_POINT 				��ǰ���λ������ڵ�ǰ������ʼ������ "
    echo "\t COMP_KEY 					��������shell������ȫ���ܵ����һ���� "
    echo "\t COMP_TYPE 					һ������ֵ����ʾ�����ԵĲ�ȫ���ͣ��������shell������ȫ "
    echo "\t COMP_WORDBREAKS 			Readline�������ڵ��ʲ�ȫ�Ĵʷָ��ַ� "
    echo "\t COMP_WORDS 				���е�ǰ���������е��ʵ�������� "
    echo "\t COMPREPLY 					COPROC ������shell�������ɵĿ����������������� ռ��δ������Э���̵�I/O�ļ���������������� "
    echo "\t DIRSTACK 					����Ŀ¼ջ��ǰ���ݵ�������� "
    echo "\t EMACS 						����Ϊ't'ʱ������emacs shell���������ڹ��������б༭���ܱ���ֹ "
    echo "\t ENV 						��������˸û�����������bash shell�ű�����֮ǰ����ִ���Ѷ���������ļ����� ���ڵ�bash shell��POSIXģʽ������ʱ�� "
    echo "\t EUID 						��ǰ�û�����Ч�û�ID��������ʽ�� "
    echo "\t FCEDIT 					��fc����ʹ�õ�Ĭ�ϱ༭�� "
    echo "\t FIGNORE 					�ڽ����ļ�����ȫʱ���Ժ��Ժ�׺���б���ð�ŷָ� "
    echo "\t FUNCNAME 					��ǰִ�е�shell����������  "
    echo "\t FUNCNEST 				    �����óɷ���ֵʱ����ʾ������������Ƕ�׼�����һ����������ǰ�������ֹ��  "
    echo "\t GLOBIGNORE 				ð�ŷָ���ģʽ�б��������ڽ����ļ�����չʱ���Ժ��Ե�һ���ļ���  "
    echo "\t GROUPS 					���е�ǰ�û������б���������  "
    echo "\t histchars 				    ������ʷ��¼��չ��������3���ַ�  "
    echo "\t HISTCMD 				    ��ǰ��������ʷ��¼�еı��  "
    echo "\t HISTCONTROL 			    ������Щ����������ʷ��¼�б���  "
    echo "\t HISTFILE 				    ����shell��ʷ��¼�б���ļ�����Ĭ����.bash_history��  "
    echo "\t HISTFILESIZE 			    HISTTIMEFORMAT �������ʷ�ļ��д������ ����������ҷǿգ���������ʽ���ַ���������ʾbash��ʷ��ÿ�������ʱ���  "
    echo "\t HISTIGNORE 				��ð�ŷָ���ģʽ�б�����������ʷ�ļ�����Щ����ᱻ����  "
    echo "\t HISTSIZE 				    �������ʷ�ļ��д����������  "
    echo "\t HOSTFILE 				    shell�ڲ�ȫ������ʱ��ȡ���ļ�����  "
    echo "\t HOSTNAME 				    ��ǰ����������  "
    echo "\t HOSTTYPE 				    ��ǰ����bash shell�Ļ���  "
    echo "\t IGNOREEOF 				    shell���˳�ǰ�����յ�������EOF�ַ���������������ֵ�����ڣ�Ĭ����1��  "
    echo "\t INPUTRC 				    Readline��ʼ���ļ�����Ĭ����.inputrc��  "
    echo "\t LANG 					    shell�����Ի������ LC_ALL ������һ�����Ի�������ܹ�����LANG����  "
    echo "\t LC_COLLATE 				���ö��ַ�������ʱ�õ��������  "
    echo "\t LC_CTYPE 				    ������ν��ͳ������ļ�����չ��ģʽƥ���е��ַ�  "
    echo "\t LC_MESSAGES 			    �ڽ���ǰ�����\$��˫�����ַ���ʱ���û������������������õ����Ի�������  "
    echo "\t LC_NUMERIC 				�����Ÿ�ʽ������ʱ���õ����Ի�������  "
    echo "\t LINENO 					��ǰִ�еĽű����к�  "
    echo "\t LINES 					    �������ն��Ͽɼ�������  "
    echo "\t MACHTYPE 				    �á�CPU?��˾?ϵͳ����CPU-company-system����ʽ�����ϵͳ����  "
    echo "\t MAPFILE 				    һ�������������mapfile����δָ�����������Ϊ����ʱ�����洢��mapfile��������ı�  "
    echo "\t MAILCHECK 				    shell�鿴���ʼ���Ƶ�ʣ�����Ϊ��λ��Ĭ��ֵ��60��  "
    echo "\t OLDPWD 					shell֮ǰ�Ĺ���Ŀ¼ OPTERR ����Ϊ1ʱ��bash shell����ʾgetopts��������Ĵ���  "
    echo "\t OSTYPE 					������shell���ڵĲ���ϵͳ  "
    echo "\t PIPESTATUS 				����ǰ̨���̵��˳�״̬�б���������  "
    echo "\t POSIXLY_CORRECT 		    �����˵Ļ���bash����POSIXģʽ����  "
    echo "\t PPID 					    bash shell�����̵�PID PROMPT_COMMAND �����˵Ļ���������������ʾ����ʾ֮ǰ��ִ����������  "
    echo "\t PROMPT_DIRTRIM 			�������嵱������\w��\W��ʾ���ַ���ת��ʱ��ʾ��β��Ŀ¼������������ɾ���� Ŀ¼������һ��Ӣ�ľ���滻  "
    echo "\t PS3 					    select�������ʾ��   "
    echo "\t PS4 			            ���ʹ����bash��-xѡ���������֮ǰ��ʾ����ʾ��Ϣ "
    echo "\t PWD 			            ��ǰ����Ŀ¼ RANDOM ����һ��0��32767�������������ĸ�ֵ����Ϊ����������������ӣ� "
    echo "\t READLINE_LINE 	            ��ʹ��bind �Cx����ʱ���洢Readline������������ "
    echo "\t READLINE_POINT 	        ��ʹ��bind �Cx����ʱ����ʾReadline���������ݲ����ĵ�ǰλ�� "
    echo "\t REPLY 			            read�����Ĭ�ϱ��� "
    echo "\t SECONDS 		            �Դ�shell���������ڵ����������丳ֵ�������ü������� "
    echo "\t SHELL 			            bash shell��ȫ·���� SHELLOPTS ������bash shellѡ���б��б���֮����ð�ŷָ� "
    echo "\t SHLVL 			            shell�Ĳ㼶��ÿ������һ����bash shell����ֵ����1 "
    echo "\t TIMEFORMAT 		        ָ����shell��ʱ����ʾ��ʽ "
    echo "\t TMOUT 			            select��read������û���������µȴ���ã�����Ϊ��λ����Ĭ��ֵΪ0����ʾ ���޳� TMPDIR Ŀ¼��������bash shell��������ʱ�ļ� UID ��ǰ�û�����ʵ�û�ID "




echo "================================================================================================================="
echo "6.5 ����PATH��������"
    echo $PATH



echo "================================================================================================================="
echo "6.6 ��λϵͳ�������� "
    echo "6.6.1 ��½shell"
#        ? /etc/profile                     �������ļ�
#        ? $HOME/.bash_profile              �����ĸ�Ϊ���а汾�����ļ�
#        ? $HOME/.bashrc
#        ? $HOME/.bash_login
#        ? $HOME/.profile

    echo "6.6.2 ����ʽshell����--ֻ�����û�HOMEĿ¼�е�.bashrc�ļ�"

    echo "6.6.3 �ǽ���ʽ shell--bash shell�ṩ��BASH_ENV��������[printenv BASH_ENV]"

    echo "6.6.4 ���������־û� "



echo "================================================================================================================="
echo "6.7 �������"
    my_array=(one two three four five)
    echo ${my_array[2]}
    echo ${my_array[*]}
    my_array[3]=seven
    echo ${my_array[3]}
    # ɾ������
    unset my_array
    echo ${my_array[*]}
