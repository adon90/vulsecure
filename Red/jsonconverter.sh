#!/bin/bash

#################################
#				#
#	vulSecure client 0.1	#
#				#
#################################

# Scanning from apps.txt

name="";
version="";

# NODE INFO


echo -e "{\"Node\":[{\"MAC\":\""mac1"\", \"cores\":\""8"\", \"ram\":\""16"\"}]}"

echo -e "\n"

# OS INFO

name=$(lsb_release -a 2> /dev/null | grep Description | awk '  {print $2} ')

version=$(lsb_release -a 2> /dev/null | grep Description | awk '  {print $3} ')

echo -e "{\"OS\":[{\"name\":\"$name"\", \"version\":\"$version"\"}]}"

echo -e "\n"

# SOFTWARE PRODUCTS INFO


echo -e "{\n\"Products\":["


{
while read softwareProduct
do

	name=$softwareProduct

	version=$(dpkg-query --status $softwareProduct |grep Version | awk '{print $2}')

	if [ ! -z "${version}" ]; then
		echo -e {\"product\":\""$name"\", \"version\":\"$version\"}, | sed 's/\},\n\]/\}\n\[/g'

	else
		echo -e {\"product\":\""$name"\", \"version\":\"Not installed\"}, | sed 's/\},\n\]/\}\n\]/g'
	fi

done < apps.txt;

echo -e "]\n}"
} 2> /dev/null

