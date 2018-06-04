#!/bin/bash
a=0
for name in *.*
do
	b=$(ls -l $name |awk '{print $5}')
	if [ $b -ge $a ];then
		a=$b
		maxfile=$name
	fi
done
echo "The max file is $maxfile,size $a K"
