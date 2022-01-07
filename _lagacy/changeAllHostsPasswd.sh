#!/bin/bash
## Usage
### if u want to change root passwd
### . changeAllHostsPasswd.sh
### elif u want to change general user passwd

username=$1
if [ ${#username} -eq 0 ];then
    username=root
fi

passNew=`cat ./_files/passNew`
password=`cat ./_files/password`
for ip in $(cat ./_files/hosts); do
	echo $ip set password.
    sshpass -p $password ssh $ip "sudo echo $passNew|sudo passwd --stdin $username >/tmp/null"
done
