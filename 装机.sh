#!/bin/bash
read -p "hostname?" name
echo "$name" > /etc/hostname
while :
      do
	 stty -echo
         read -p 'passwd?' num1
	 echo 
         read -p 'passwd agin?' num2
	 echo
	 stty echo
         if [ $num1 == $num2 ];then
            if [ -z $num1 ];then
	       echo 密码不能为空
	    else
	       echo "$num1" | passwd --stdin root &> /var/null && break
	    fi
         else
             echo 两次输入的密码不一致
         fi
      done
rm -rf /etc/yum.repos.d/*
touch /etc/yum.repos.d/new.repo
echo "[new]"> /etc/yum.repos.d/new.repo
echo "name=new" >> /etc/yum.repos.d/new.repo
ipo=$(ifconfig | head -2 | awk '/inet/{print $2}')
ipos=${ipo%\.*}.254
echo "baseurl=http://$ipos/rhel7" >> /etc/yum.repos.d/new.repo
echo "enables=1" >> /etc/yum.repos.d/new.repo
echo "pgpcheck=0" >> /etc/yum.repos.d/new.repo
yum=$(yum repolist | awk '/repolist/{print $2}' | sed 's/\,//')
if [ $yum -eq 0 ];then
	echo "yum源配置失败"
else
	echo "yum源配置成功"
fi
m=0
while :
do
	read -p '请输入要配置的网卡编号(eth~)' nv
	if [ -z $nv ];then
	for i in ${num[@]}
	do
	nmcli connection up eth$i
	done
	sleep 2 && break
	elif [ $nv -ge 0 ] 2> /var/null;then
	read -p "请输入IP/子网掩码" p
	nmcli connection modify eth$nv ipv4.method manual ipv4.addresses $p connection.autoconnect yes
	num[$m]=$nv
	let m++	
	elif [ $nv -gt 0 ];then
	read -p "请输入IP/子网掩码" p
	nmcli connection add type ethernet con-name eth$nv ifname eth$nv
	sleep 2
	nmcli connection modify eth$nv ipv4.method manual ipv4.addresses $p connection.autoconnect yes
	num[$m]=$nv
        let m++
	fi
done
reboot
