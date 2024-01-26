#!/bin/bash

echo "Checking if the service is active or not"

echo " Please select which service you want to check"
echo "1.  http"
echo "2.  ssh"
echo "3.  apache2"
echo "4.  All"

read -p " Enter your choice : " user_choice

#Setting up the service based on the user input 
case $user_choice in
	1) service="http";;
	2) service="sshd";;
	3) service="apache2";;
	4) service="http sshd apache2";;
	*) echo " Invalid Option "; exit 1;;
esac

#Checking the service status
if [ "$(sudo systemctl is-active $service)" == "active" ]; then
	echo "System is Active"
else
	echo "System is not active"
	read -p " do you want to activate it now, Write Y for yes and N for no: " service_choice
	case $service_choice in
	    Y|y) active="Y";;
	    N|n) active="N";;
	    *) echo "Invalid option"; exit 1;;
	esac

	if [ "$active" == "Y" ] || [ "$active" == "y" ]; then
	   sudo systemctl start $service
	   echo "$service is Active now"
	else
		echo "YOu don't want to active service thank you"
	fi
fi
