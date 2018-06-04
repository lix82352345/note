#!/bin/bash
#for i in {1..254}
#do 
#	ping -c 2 -i 0.2 -W 1 172.242.8.$i &> /dev/null
#	if [ $? -eq 0 ];then
#	echo "172.242.8."$i"的主机通了"
#	else
#	echo "172.242.8."$i"的主机不通"
#	fi
#done

> /root/ping.txt
i=0
while [ $i -lt 254 ]
do 
	let i++
	ping -c 2 -i 0.2 -W 1 172.242.8.$i &> /dev/null
	if [ $? -eq 0  ] ;then
	echo "172.242.8."$i"的主机通了"
	echo "172.242.8."$i"的主机通了" >> /root/ping.txt
	else
	echo "172.242.8."$i"的主机不通"
	fi
done	
