#!/bin/sh
#SRCIPs="101.31.1.10 101.31.1.12"
SRCIPs="101.31.1.10 101.31.1.12"
VIP=201.31.1.5
URL="http://${VIP}/lava.html"
loop=$1
if [ "$loop" == "" ]; then
	loop=2
fi

while [ $loop -gt 0 ];
do
	for srcip in ${SRCIPs}; do
		wget --bind-address=${srcip} ${URL}
	done

	sleep 1
	rm -vf lava.html*
	loop=`expr $loop - 1`
done  
