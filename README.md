# CTR_CACleanup
Continous Archive Cleanup for Nanometrics Centaur

Bash Script to continously clear up continous data archive
Arguments: treshold

Limitations: Data need to be in the default form i.e. /media/removable0/2024/06/(...).miniseed
Should be amended to the Continous Archive String in the long run


Script needs to be run as cronjob and will log to /var/log/syslog
Needs write permission in /media/removable0
