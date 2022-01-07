# Install & Setting
## Install Usage
```
sudo -i
cd /usr/local/bin
git clone https://github.com/nowage/hsDo.git
echo "export PATH=\$PATH:/usr/local/bin/hsDo" >> ~/.profile
```

## Host Setting
* _files/hostsAll
* _files/hostsMain
* _files/password (if needed)

# Usage :
```
 usage1 : hsdo.sh ls
 usage2 : hsdo.sh -aek:root whoami
 usage3 : copy
   usage : hsdo -ack /source-folder/filename [/root]
   example hsdo -ack /root/_prgs/\* /root/_prgs/


## Destination    → 1.optDest
### All           a
### Main          m
### NotMain       n : future
### One           1 : future

## Command        → 2.optCmd
### Execute       e
### Copy          c
### Setting       s : future

## Authentication → 3.optAuth
### Key           k
### Password      p

```



# toDo
1. sshpass ==> expect
2. Destination : one hosts
3. Command : setting
