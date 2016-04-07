#!/bin/sh
#example: /usr/local/mongodb/bin/mongod --fork --dbpath=/data/mongodb/ --logpath=/usr/local/mongodb/mongodb.log --logappend
datafile=/data/mongodb/
logfile=/usr/local/mongodb
days=7 #retain the lastest 7 days logs
/bin/kill -SIGUSR1 `cat $datafile/mongod.lock` #rotate
find $logfile/mongodb.log.* -type f -mtime +$days -delete
#Remember: chmod +x mongodb_rotate_log.sh



Another rotate log for nginx:
  vi /etc/logrotate.d/nginx:
/home/wwwlogs/*.log {
    daily
    dateext
    compress
    rotate 30
    sharedscripts
    postrotate
        [ ! -f /usr/local/nginx/logs/nginx.pid ] || kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
        mv /home/wwwlogs/*.log-*.gz /home/wwwlogs/backup/
    endscript
}

#Running Test: logrotate -d -f /etc/logrotate.d/nginx
#Excute right now: logrotate -f /etc/logrotate.d/nginx
#Note: Compress would be excuted after the script, we have moved the log file to another place 
# which would make the file not compressed. One solution is moved the .gz files only.


