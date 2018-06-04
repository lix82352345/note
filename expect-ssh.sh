#!/bin/bash
expect << EOF
spawn ssh 192.168.4.207
expect "password" {send "1\n"}
expect "#"	  {send "touch /expect11.txt\n"}
expect "#"	  {send "exit\n"}
EOF

