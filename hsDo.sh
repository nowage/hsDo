#!/bin/bash
# usage :
##     . hsDo.sh -aek:nowage -t sudo whoami
##     . hsDo.sh pwd
## -- option ----
##
## optDest = a, m, n (All, Main, Node)
## optCmd  = e, c    (Execute, copy)
## optAuth = p, k    (Passwd, Key)
main (){
# setting #####################
unset false
true=1
## Parameters
isError=$false
iserrorMsg='n/a'

# parameter Check #############################
opts=$1
scriptFile=$0
scriptHome=$(dirname $scriptFile)
if [ ${#opts} -eq 0  ];then
    echo "usage :"
    echo "     . hsDo.sh -aek:nowage -t sudo whoami"
    echo "     . hsDo.sh pwd"
    echo " -- option ----"
    echo " optDest = a, m, n (All, Main, Node)"
    echo " optCmd  = e, c    (Execute, copy)"
    echo " optAuth = p, k    (Passwd, Key)"
    echo "--- Setting file Path--"
    echo $scriptHome/_files

    errorMsg="no parameter to do."
    isError=$true
    return
fi
# echo $opts=$1

# if first argument is a option.
if [ ${opts:0:1} == "-" ]; then
    opts=${opts:1}
    p1=$2;p2=$3;p3=$4;p4=$5;p5=$6;p6=$7;p7=$8;p8=$9
    isDefaultOpts=false
    optByWho=${opts:4}
    if [ ${#optByWho} -eq 0 ]; then
        optByWho=root
    fi
else
    opts=aek
    optByWho=root
    p1=$1;p2=$2;p3=$3;p4=$4;p5=$5;p6=$6;p7=$7;p8=$8;p9=$9;
    isDefaultOpts=true
fi
echo option:$opts  isDefaultOpts:$isDefaultOpts
optDest=${opts:0:1}
optCmd=${opts:1:1}
optAuth=${opts:2:1}

#echo $optDest, $optCmd, $optAuth $optByWho

#echo $p1 ${#p1}
if [ ${#p1} -eq 0 ];then
    errorMsg="no parameter to do.x."
    isError=$true
    return
fi
###########################################################

# Prepare #########################
## get hosts #############################
ha=`cat $scriptHome/_files/hostsAll|sort`
hm=`cat $scriptHome/_files/hostsMain|sort`
cat $scriptHome/_files/hostsAll|sort>/tmp/.tmp
for i in $(echo $hm); do
    cat /tmp/.tmp|grep -v $i>/tmp/.tmp2
    mv  -f /tmp/.tmp2 /tmp/.tmp
done
hn=`cat /tmp/.tmp`
rm -f /tmp/.tmp


echo Destination = $optDest
echo ----------------------------------------
case "$optDest" in
    a)
        hh=$ha
        ;;
    m)
        hh=$hm
        ;;
    n)
        hh=$hn
        ;;
    *)
    errorMsg="No Hosts setting is not set."
    isError=$true
esac
case $optAuth in
    k)
        authCmd=''
    ;;
    p)
        password=`cat $scriptHome/_files/password`
        echo $authCmd
        echo $password
        authCmd="sshpass -p $password"
    ;;
    *)
        errorMsg="Auth option is wrong. use k or p."
        isError=$true
    ;;
esac

if [ $isError ]; then
    return
fi

# echo  $ha xx $hm xx $hn
# echo ---$hh-----------------

case "$optCmd" in
    e)
        for ip in $hh; do
            echo $ip execute : $p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8 $p9
            $authCmd ssh -o StrictHostKeyChecking=no $optByWho@$ip $p1 $p2 $p3 $p4 $p5 $p6 $p7 $p8 $p9
            echo '-------------------------------'
        done
        ;;
    c)
        src=$p1
        dest=$p2
        username=$optByWho
        echo $optByWho --------$username-----------------------------
        if [[ ${#dest} -eq 0 ]]; then
            dest=/root/
        fi

        for ip in $hh; do
            echo $ip file coping.   scp $src $username@$ip:$dest
            $authCmd scp -o StrictHostKeyChecking=no $src $username@$ip:$dest
        done
        ;;
    *)
        errorMsg="Command option is wrong. use e,c or s."
        isError=$true
esac


# if [ ${#hadoopHome} -eq 0 ];then
#     isError=$true
#     errorMsg="No Hadoop) "
#     return
# fi

}

main "$@"

if [ $isError ]; then
    ################################################################################
    echo -------------- Error Message-----------------------------------------------
    echo $errorMsg
    echo ---------------------------------------------------------------------------
fi
