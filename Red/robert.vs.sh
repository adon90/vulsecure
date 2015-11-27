#!/bin/bash

#################################
#				#
#	vulSecure client 0.1	#
#				#
#################################

# Scanning from apps.txt

name="";
version="";

echo -e "-------:::VulSecure 0.1 client:::-------- \n"

echo -e "NODE IP: 192.168.1.26 \n"

echo -e "HARDWARE INFO: \n"

echo $(lscpu | grep Architecture)

echo $(lscpu | grep CPU)

echo -e "\n"

echo -e "OPERATING SYSTEM INFO: \n"

echo $(lsb_release -a 2> /dev/null)

echo -e "\n"

echo -e "SOFTWARE PRODUCTS INFO: \n"
{
while read softwareProduct
do

	name=$softwareProduct

	echo Product: $name

	version=$(dpkg-query --status $softwareProduct |grep Version)

	if [ ! -z "${version}" ]; then
		echo -e "$version \n"
	else
		echo -e "Not installed on this node\n"
	fi

done < apps.txt;
} 2> /dev/null
