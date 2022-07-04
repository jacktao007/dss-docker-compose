#!/bin/bash

SELF=${0##*/}
ARGS=$*

#
# 检查进程健康
# 0 - 健康
# 1 - 部分进程退出
# 2 - 所有进程退出
#
function checkall() {
        echo "=== 开始检查 $* ==="
	EXIST=0
	GONE=0
        for NAME in $*
        do
		CHK=$(ps ax | grep $NAME | grep -v $SELF | grep -v grep | wc -l)
		echo "检查 $NAME => $CHK"
                if [[ $CHK -gt 0 ]]; then
			EXIST=1
		else
			GONE=1
		fi
        done
	
	if [[ $EXIST -eq 0 ]]; then
		return 2
	elif [[ $GONE -eq 0 ]]; then
		return 0
	else
		return 1
	fi
}

#
# 等待进程退出
#
function waitall() {
	echo "=== 开始等待 $* ==="
	for cnt in {1..60}
	do
		checkall $*
		if [[ $? != 2 ]]; then
			sleep 1
		else
			return
		fi
	done
}

#
# 查找并kill进程, 并等待退出, 并退出脚本
#
function stopall() {
	echo "=== 开始退出 $* ==="
	for NAME in $*
	do
		PIDS=$(ps ax | grep $NAME | grep -v $SELF | grep -v grep | awk '{print $1}')
		echo "寻找 $NAME pids = $PIDS"
		for PID in $PIDS
		do
			echo "kill $PID"
			kill $PID
		done
	done
}

# 捕获 Ctrl-C 和 kill
trap "echo '收到 Ctrl - C' && stopall $ARGS && waitall $ARGS" SIGINT
trap "echo '收到 kill'     && stopall $ARGS && waitall $ARGS" SIGTERM

# 第一次程序启动多等待 60 秒
while true
do
	echo "等待 120 秒"
	sleep 120
	checkall $ARGS
	if [[ $? != 0 ]]
	then
		stopall $ARGS
		waitall $ARGS
		exit
	fi
done
