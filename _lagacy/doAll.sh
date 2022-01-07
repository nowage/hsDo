#!/bin/bash
echo ## start by doAll.sh ######################################################


cd ~/_hostsSetting
. fileCopyAll.sh hostOneNode.sh
. cmdExecuteAll.sh "su - hadoop --command='hadoop jar /data/hadoop/hadoop-2.7.1/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar pi 10 10 '"

. fileCopyAll.sh ~/yarn-site.xml /data/hadoop/hadoop-2.7.1/etc/hadoop/yarn-site.xml
