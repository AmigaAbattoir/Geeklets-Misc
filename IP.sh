#!/bin/bash
wired=`ifconfig en0 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`
wifi=`ifconfig en1 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`
display=`ifconfig en4 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`
display2=`ifconfig en3 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`
vpn=`ifconfig utun0 | grep "inet" | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`

currentIP="0.0.0.0"
statusIP="";

# If the VPN device is available, set the status to show it, but don't store the IP for Adium
if [ "$vpn" != "" ]
then
    statusIP="VPN IP: $vpn"
fi


if [ "$wired" != "" ]
then
    statusIP="$statusIP WIRED IP: $wired"
    currentIP="$wired"
elif [ "$display" != "" ]
then
    statusIP="$statusIP THUNDERBOLT IP: $display"
    currentIP="$display"
elif [ "$display2" != "" ]
then
    statusIP="$statusIP THUNDERBOLT IP: $display2"
    currentIP="$display2"
elif [ "$wifi" != "" ]
then
    statusIP="$statusIP WIFI IP: $wifi"
    currentIP="$wifi"
else
    statusIP="No Internet connection!"
fi

echo "$statusIP"
echo "$currentIP" > private/tmp/ip.txt

