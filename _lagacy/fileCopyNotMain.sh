#!/bin/bash
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`
src=$1
dest=$2
username=$3


if [[ ${#src} -eq 0 ]]; then
	echo usage : . fileCopyAll.sh /source-folder/filename [/root]
	echo example . fileCopyAll.sh /root/_prgs/\* /root/_prgs/
else
	if [[ ${#dest} -eq 0 ]]; then
		dest=/root/
	fi
	if [[ ${#username} -eq 0 ]]; then
		username=root
	fi

	for ip in $(cat ./_files/hostsNotMain); do
		echo $ip file coping. 	    sshpass -p $passNew scp $src $ip:$dest
	    sshpass -p $passNew scp $src $useranme@$ip:$dest
	done
fi
