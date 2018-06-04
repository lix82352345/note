#!/bin/bash
awk '/Failed/&&$10=="from"{print $11}' /var/log/secure |awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' | awk '$1>3{print $2}'
awk '/Invalid/{print $10}' /var/log/secure | awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' | awk '$1>3{print $2}'

