#!/bin/bash

touch ping.txt 2> /dev/null
#arp -d
echo $1
ping -q -c4 $1 > /dev/null 2>/dev/null
echo $? $1 >> ping.txt

