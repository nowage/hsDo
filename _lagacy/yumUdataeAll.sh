#!/bin/bash
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`

for ip in $(cat ./_files/hosts); do
	x=`ifconfig|grep $ip`
	if [[ ${#x} -eq 0 ]]; then
		#remote host
		echo $ip yum update
		sshpass -p $passNew ssh $ip "nohup yum -y update 1> /dev/null 2>&1 &"
	else
		#This host.
		yum update -y
		echo ################################################################################
		echo ###### Reboot after yum update #################################################
		echo ################################################################################

	fi
done

