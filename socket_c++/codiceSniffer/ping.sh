#!/bin/bash

touch ping.txt 2> /dev/null
ping -q -c4 $1 > /dev/null 2>/dev/null
echo $? $1 >> ping.txt

