#!/bin/bash
#read -p "请输入第一个整数：" num1
#read -p "请输入第二个整数：" num2
#read -p "请输入第三个整数：" num3
#if [ $num1 -gt $num2  ];then
#       num4=$num1
#       num1=$num2
#       num2=$num4
#fi
#if [ $num2 -gt $num3 ];then
#       num5=$num2
#       num2=$num3
#       num3=$num5
#fi
#if [ $num1 -gt $num2  ];then
#       num4=$num1
#       num1=$num2
#       num2=$num4
#fi
#echo "从小到大排序为：$num1 $num2 $num3"



#read -p "请输入几个数字来排序：" x
#for ((i=1;i<=$x;i++))
#do
#        read -p "请输入第"$i"个整数" num[$i]
#        echo ${num[$i]}
#
#done
#m=$[x-1]
#for ((a=1;a<=$x;a++))
#do
#s=1
#        for ((n=1;n<=$m;n++))
#        do
#                let s++
#                #echo "$n,$s  "
#                if [ ${num[$n]} -gt ${num[$s]} ] ;then
#                        tmp=${num[$n]}
#                        num[$n]=${num[$s]}
#                        num[$s]=$tmp
#                fi
#        done
#m=$[m-1]
#done
#echo ${num[@]}

echo "请输入数字（以空格分开）:"
read -a arrs
for ((i=0;i<${#arrs[@]}-1;i++))
do
	for ((j=0;j<${#arrs[@]}-1;j++))
	do
		if [ ${arrs[j]} -gt ${arrs[j+1]}  ];then
			tmp=${arrs[j]}
			arrs[j]=${arrs[j+1]}
			arrs[j+1]=$tmp
		fi
	done
done
echo ${arrs[@]}
