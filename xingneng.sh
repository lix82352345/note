#!/bin/bash
ip=`ifconfig eth0 | awk '/inet /{print $2}'`
echo "本机的IP地址为："$ip
cpu=`uptime | awk '{print $10}' | sed 's/,//'`
echo "本机CPU最近5分钟的负载是："$cpu
net_in=`ifconfig eth0 | awk  '/RX p/{print $6,$7}' | sed 's/(//' | sed 's/)//'`
echo "入站网卡流量为："$net_in
net_out=`ifconfig eth0 | awk  '/TX p/{print $6,$7}' | sed 's/(//' | sed 's/)//'`
echo "出站网卡流量为："$net_out
mem=`free | awk '/Mem/{print $7}'`
echo "内存剩余容量为："$mem
disk=`df | awk '/\/$/{print $4}'`
echo "根分区剩余容量为："$disk
user=`cat /etc/passwd | wc -l`
echo "本地账户数量为："$user
login=`who | wc -l`
echo "当前登录计算机的账户数量为："$login
process=`ps aux |wc -l`
echo "当前计算机启动的进程数量为："$process
soft=`rpm -qa |wc -l`
echo "当前计算机已安装的软件数量为："$soft
