#!/bin/bash

#Let's Start Monitoring the Server

monitor_cpu () {
	echo "Monitoring of CPU "
	top -bn 1 | grep "%Cpu(s)"
}
monitor_memory () {
	echo "Monitoring of Memory"
	free -hm
}
monitor_network () {
	echo "Monitoring of network"
	ifconfig -a
}
monitor_disk_usage () {
	echo "Monitoring of Disk Usage "
	df -hT
}
monitor_load_average () {
	echo "Monitoring of Load on CPU"
	uptime
}


main () {
	echo "==========CPU =========="
        monitor_cpu
	#
	#
	echo "==========Memory =========="
        monitor_memory
	#
	#
	echo "==========Network =========="
        monitor_network
	#
	#
	echo "==========Disk Usage =========="
	monitor_disk_usage
	#
	#
	echo "==========Load =========="
	monitor_load_average
}

main

exit 0
