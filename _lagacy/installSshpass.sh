x=`rpm -qa|grep sshpass`
if [ ${#x} -eq 0 ] 
then 
	wget http://dl.fedoraproject.org/pub/epel/6/x86_64/sshpass-1.05-1.el6.x86_64.rpm
	rpm -Uvh sshpass-1.05-1.el6.x86_64.rpm
	rm -f sshpass-1.05-1.el6.x86_64.rpm
fi
if [ -d ~/.ssh/ ]
then
	echo '.ssh exist'
else
	mkdir ~/.ssh/
fi



