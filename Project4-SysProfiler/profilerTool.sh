#!/bin/bash

LINE="***********************"

hostname
echo "$LINE"
uname -r
echo "$LINE"
uptime -p
echo "$LINE"
free -h
echo "$LINE"
echo "$(grep "sh$" /etc/passwd | wc -l) users"
echo "$LINE"
who
echo "$LINE"
ps aux | grep -v USER | sort -nk +4 | tail -n 3
echo "$LINE"
lsblk
echo "$LINE"
uptime | sed 's/.*  //'

