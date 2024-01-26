#!/bin/bash

echo "Welcome to the backup script by Milan Chauhan"

#Creating the function of Initial variables

variables () {
	#requirements
	backup_directory="/backups"
	source_directory="/var/www /var/log/apache2 /home/milan/Desktop"
	backup_filename="backup_$(date +%d_%m_%Y).tar.gz"
	log_file="/backups/log/backup_script.log"

	#Redirecting stdout and stderr to log file
	exec &> $log_file
	#Starting the logging
	echo "========== Backup Script Log =========="
	echo "Date & Time: $(date)"

}

#Checking the source directory is exist or not

checking_source_directory() {
	echo "Checking if source directory exists: $source_directory"
	if [ ! -d $source_directory ]; then
		echo "Source Ditectory doesnot exist"
		exit 1
	fi
}

#Checking the backup directory exist or not; creating if not

checking_backup_directory() {
	if [ ! -d "$backup_directory" ]; then
		echo "Directory doesn't exist; Creating now"
		mkdir -p "$backup_directory"
	fi
}

#Creating the backup 

create_backup() {
	for dir in $source_directory; do
		tar -czf $backup_directory/$backup_filename $source_directory
	done
}


#Log backup status

log_backup() {
	if [ $? -eq 0 ]; then
		echo "Backup Completed Successfully in : $backup_directory/$backup_filename"i
	else
		echo "Error: Backup is Incomplete. Check log for more information."
	fi
}


#end Loggging

logging_end () {
	echo "========== End of Backup Script Log =========="
}

#main function to do backup process

main() {
	variables
	checking_source_directory
	checking_backup_directory
	create_backup
	log_backup
	logging_end
}

#Execution of main function
main
