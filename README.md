# Info
```
#
# Copyright (c) 2009-2016 NamJungGu <nowage@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
# Description : It works to AllHost·MainHost·ClientHost with Copy·Command·Setting.
#
```
## Maintain : https://github.com/nowage/finfra.git
# Install & Setting
## Install
```
git clone https://github.com/nowage/hsDo.git
cd hsDo/_files
cp password_org password
cp hostsMain_org hostsMain
cp hostsAll_org hostsAll
```
## Host Setting
* _files/hostsAll
* _files/hostsMain
* _files/password (if needed)

# Usage :
```
 usage1 : ./hsDo.sh ls
 usage2 : ./hsDo.sh -aek:root
 usage3 : copy
 usage : . ./hsDo.sh -ack /source-folder/filename [/root]
 example . ./hsDo.sh -ack /root/_prgs/\* /root/_prgs/


## Destination    → 1.optDest
### All           a
### Main          m
### NotMain       n : future
### One           1 : future

## Command        → 2.optCmd
### Execute       e
### Copy          c
### Setting       s

## Authentication → 3.optAuth
### Key           k
### Password      p

```



# toDo
1. sshpass ==> expect
2. Destination : one hosts
3. Command : setting
