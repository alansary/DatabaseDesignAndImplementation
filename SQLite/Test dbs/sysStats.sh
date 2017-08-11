#!/bin/bash

CDATE=`date +"%Y-%m-%d %H:%M:%S"`
MESSAGE=`uptime | sed 's/^ //'`
sqlite3 sysStats "INSERT INTO sysUptime VALUES (\"$CDATE\", \"$MESSAGE\");"

#END
