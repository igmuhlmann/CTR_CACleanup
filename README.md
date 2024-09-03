# CTR_CACleanup
Continous Archive Cleanup for Nanometrics Centaur

Bash Script to continously clear up continous data archive
Arguments: treshold

Limitations: Data need to be in the default form i.e. /media/removable0/2024/06/(...).miniseed
Should be amended to the Continous Archive String in the long run


Script needs to be run as cronjob and will log to /var/log/syslog
Needs write permission in /media/removable0


Installation:
SSH into the Centaur and copy the file archive_cleanup.sh to /usr/bin/nanometrics

Give this file executable rights
>> chmod -c 755 archive_cleanup.sh

Add the cronjob command
>> crontab -e
Add the line (for 90% treshold, modify if neccessary):

0 * * * * /usr/bin/nanometrics/archive_cleanup.sh 90

Save and exit.

Check:
>> crontab -l

Check if the script works and check output
>> /usr/bin/nanometrics/archive_cleanup.sh 90  &&  tail /var/log/syslog
The log-File should contain a line that the Script has been Activated.




