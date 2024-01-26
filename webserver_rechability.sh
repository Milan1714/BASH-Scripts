#!/bin/bash

echo "Welcome to the script to check Webserver connectivity and status code"


check_webserver(){
	local url="$1"

	echo "checking the web server status for $url"

	http_status=$(curl -Is "$url" | head -n 1 )

	if [ -n "$http_status" ]; then
		echo " The webserver is running on http_code : $http_status"
	else
		echo "The $url is not reachable"
	fi
}

#Usage
if [ $# -ne 1 ]; then
	echo " Usage: $0 <Only_1_Target_ip> "
	exit 1
fi

http_url="$1"

check_webserver "$http_url"
