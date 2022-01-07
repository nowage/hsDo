#!/bin/bash
#
# Copyright (c) 2009-2014 NamJungGu <nowage@gmail.com>
#
# Description : Set All host's host Name
#           
# Usage 1 : set to s1~s1111 
#    . setHostName.sh
#           
# Usage 2 : set to s1 all host
#    . setHostName.sh true
#           
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`
i=1
for ip in $(cat ./_files/hosts); do
	# ip=127.0.0.1
	echo $ip set /etc/sysconfig/network to s$i.
	sshpass -p $passNew scp ./_lib/lineFunction.sh $ip:/tmp/
    sshpass -p $passNew ssh $ip ". /tmp/lineFunction.sh;replaceLine 'HOSTNAME=' 'HOSTNAME=s$i'  '/etc/sysconfig/network'"
    if [[ $1 != 'true' ]]; then
    	let i=$i+1
    fi
done

