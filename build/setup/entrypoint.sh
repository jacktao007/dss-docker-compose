#!/bin/bash
nohup /usr/sbin/sshd -D &
/opt/ssh-copy-id.sh root pass localhost
/opt/ssh-copy-id.sh root pass 0.0.0.0
/opt/hadoop-2.7.2/sbin/start-dfs.sh
/opt/hadoop-2.7.2/sbin/start-yarn.sh

/opt/wait-and-kill.sh sshd
