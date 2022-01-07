#!/bin/bash
# cd ~/_hostsSetting
passNew=`cat ./_files/passNew`
for ip in $(cat ./_files/hosts); do
    echo $ip execute : $1 $2 $3 $4 $5 $6 $7 $8 $9
    sshpass -p $passNew ssh $ip $1 $2 $3 $4 $5 $6 $7 $8 $9
done
