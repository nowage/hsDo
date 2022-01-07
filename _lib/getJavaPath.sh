#!/bin/bash

#
#	This script give two function.  
#		insertLine 
#		replaceLine
#
#	Written by NamJungGu
#	nowage@gmail.com
#

###################################################################
function getJavaHome()
{
	x=`ls -als \`which /usr/bin/java\`|awk '{print $NF}'`
	y=`ls -als $x|awk '{print $NF}'`
	#/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.55.x86_64
	export javaHome=${y/\/bin\/java/}
	echo $javaHome
}
