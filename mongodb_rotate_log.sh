#!/bin/sh
#example: /usr/local/mongodb/bin/mongod --fork --dbpath=/data/mongodb/ --logpath=/usr/local/mongodb/mongodb.log --logappend
datafile=/data/mongodb/
logfile=/usr/local/mongodb
days=7 #retain the lastest 7 days logs
/bin/kill -SIGUSR1 `cat $datafile/mongod.lock` #rotate
find $logfile/mongodb.log.* -type f -mtime +$days -delete
#Remember: chmod +x mongodb_rotate_log.sh
