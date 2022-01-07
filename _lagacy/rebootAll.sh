#!/bin/bash
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`

for ip in $(cat ./_files/hosts); do
	x=`ifconfig|grep $ip`
	if [[ ${#x} -eq 0 ]]; then
		echo $ip rebooting
		sshpass -p $passNew ssh $ip "reboot"
	else
		echo '################################################################################'
		echo 'reboot $ip after install '
		echo '################################################################################'
	fi
done