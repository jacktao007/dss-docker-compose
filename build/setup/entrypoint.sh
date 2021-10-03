#!/bin/bash
nohup /usr/sbin/sshd -D &
/opt/ssh-copy-id.sh root pass localhost
/opt/ssh-copy-id.sh root pass 0.0.0.0
/opt/ssh-copy-id.sh root pass hadoop
/opt/hadoop-2.7.2/sbin/start-all.sh
hdfs dfs -mkdir -p /apps-data/root/bml/20210910/
hdfs dfs -mkdir -p /user/root

/opt/wait-and-kill.sh sshd
