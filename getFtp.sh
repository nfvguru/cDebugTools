#!/bin/sh
#SRCIPs="101.31.1.10 101.31.1.12"
SRCIPs="101.31.1.10 101.31.1.12"
VIP=201.31.1.8
URL="ftp://${VIP}/lava.txt"
loop=$1
if [ "$loop" == "" ]; then
	loop=2
fi

while [ $loop -gt 0 ];
do
	for srcip in ${SRCIPs}; do
		wget --user=ftpuser --password=ftppass --bind-address=${srcip} ${URL}
	done

	sleep 1
	rm -vf lava*
	loop=`expr $loop - 1`
done  
