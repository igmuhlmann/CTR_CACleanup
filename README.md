# CTR_CACleanup
Continous Archive Cleanup for Nanometrics Centaur

Bash Script to continously clear up continous data archive
Arguments: treshold

Limitations: Data need to be in the default form i.e. /media/removable0/2024/06/(...).miniseed
Should be amended to the Continous Archive String in the long run


Script needs to be run as cronjob and will log to /var/log/syslog
Needs write permission in /media/removable0


Installation:
ssh to CTR and create a file in /usr/bin/nanometrics/
>> cd /usr/bin/nanometrics/ && touch archive_cleanup.sh

Give this file executable rights
>> chmod -c 755 archive_cleanup.sh

Add the cronjob command
echo "0 * * * * /usr/bin/nanometrics/archive_cleanup.sh 90" >> /etc/crontab
