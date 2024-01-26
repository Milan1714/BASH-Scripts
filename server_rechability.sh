#!/bin/bash

echo "Purpose of this script to check the connectivity of the servers"

server_check (){
	local target_ip="$1"

	echo " Please wait....ubuntu is checking the connectivity of $target_ip"


	if ping -c 1 "$target_ip" > /dev/null; then
		echo "Server $target_ip is rechable"
	else
		echo "Server $target_ip is out of range"
	fi
}

read -p "Enter the Target IP Address: " ip_address

server_check "$ip_address"
