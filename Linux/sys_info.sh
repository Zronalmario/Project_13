#!/bin/bash

mkdir ~/research 2> /dev/null

echo "A Quick System Audit Script"
date >> ~/research/sys_info1.txt
echo "" >> ~/research/sys_info1.txt
echo "Machine Type Info:" >> ~/research/sys_info1.txt
echo $MACHTYPE >> ~/research/sys_info1.txt
echo -e "Uname info: $(uname -a) \n" >> ~/research/sys_info1.txt
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> ~/research/sys_info1.txt
echo "Hostname: $(hostname -s) ">> ~/research/sys_info1.txt
echo "DNS Servers: "
cat /etc/resolv.conf
echo "Memory Info:"
free
echo -e "\nCPU Info:"
lscpu | grep CPU
echo -e "\nDisk Usage:"
df -H | head -2
echo -e "\nWho is logged in: \n $(who) \n"
echo -e "\n777 Files:" >>  ~/research/sys_info.txt
find / -type f -perm 777 >> ~/research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt

