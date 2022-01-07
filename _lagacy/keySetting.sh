### Key Setting ########
if [ -e ~/.ssh/id_rsa ]	;then
	rm -f ~/.ssh/id_rsa
fi
if [ -e ~/.ssh/id_rsa.pub ]	;then
	rm -f ~/.ssh/id_rsa.pub
fi
ssh-keygen -t rsa -q -f ~/.ssh/id_rsa -N ''
if [ -e ~/.ssh/config ]	;then
	x=`cat ~/.ssh/config|grep \^StrictHostKeyChecking`
fi
x=''
if [ ${#x} -eq 0 ] ; then 
        echo "StrictHostKeyChecking no">>~/.ssh/config
        chmod 600 ~/.ssh/config
fi

