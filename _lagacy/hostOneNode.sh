ip=`ifconfig|grep 'inet 192'|awk '{print $2}'`
cat>/etc/hosts<<EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
$ip s1
EOF
