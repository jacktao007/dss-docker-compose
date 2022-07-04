#!/bin/bash
mkdir -p /tmp/linkis/root
/opt/linkis/sbin/linkis-start-all.sh
/usr/sbin/sshd -D
