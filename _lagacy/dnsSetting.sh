#!/bin/bash
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`
for ip in $(cat ./_files/hosts); do
	x=`sshpass -p $passNew ssh $ip "ls /etc/|grep resolv.conf"`
	if [[ ${#x} -ne 0 ]]; then
		x=`sshpass -p $passNew ssh $ip "cat /etc/resolv.conf |grep '^nameserver'"`
	fi
	
	if [[ ${#x} -eq 0 ]]; then
		echo $ip set dns.
		sshpass -p $passNew scp ./_files/resolv.conf $ip:/etc/
		sshpass -p $passNew ssh $ip ls /etc/resolv.conf
	else
		echo '$ip : Resolv.conf file exist'
	fi
done
