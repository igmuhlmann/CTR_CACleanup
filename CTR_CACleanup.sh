#!/bin/bash

# Script to continously clear up continous data archive
# Arguments: treshold
# Limitations: Data need to be in the default form i.e. /media/removable0/2024/06/(...).miniseed
# Should be amended to the Continous Archive String in the long run
# Script needs to be run as cronjob and will log to /var/log/syslog


# This is the treshold, given as input argument
treshold=$1

# Check the disk usage of /media/removable0
usage=$(df /media/removable0 | awk 'NR==2 {print $5}' | sed 's/%//')
# Check if usage is greater than 80%
while [ "$usage" -gt "$treshold" ]
do
  # Continously update usage
  usage=$(df /media/removable0 | awk 'NR==2 {print $5}' | sed 's/%//')
  echo "Continous Archive $usage% exceeds limit of $treshold%. Deleting oldest file."
  # Navigate to the base directory
  cd /media/removable0/
  # Find the folder with the lowest year number
  lowest_year=$(find . -mindepth 1 -maxdepth 1 -type d -printf '%P\n' | sort | head -n 1)
  # Find the folder with the lowest month number within the lowest year folder
  lowest_month=$(find "$lowest_year" -mindepth 1 -maxdepth 1 -type d -printf '%P\n' | sort | head -n 1)
  # Navigate to the folder with the lowest year and month
  target_folder="$lowest_year/$lowest_month"
  cd "$target_folder"
  # Find the oldest .miniseed file within the target folder
  filename=$(find . -type f -name "*.miniseed" -printf '%p\n' | sort | head -n 1)
  fullname=$(echo "$(pwd)/$filename")

  rm -rf `echo $fullname`
  echo $fullname file deleted.
  logger "Continous Archive usage was exeeding treshold ($usage%>$treshold%). File $fullname deleted."
done




