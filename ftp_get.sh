#!/bin/bash
HOST='nightly.collectionspace.org'
USER='anonymous'
PASSWD='download@collectionspace.org'
PATH='pub/collectionspace/releases/3.3'
FILE='apache-tomcat-6.0.33-2013-07-09.tar.gz'

/usr/bin/ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
passive
cd $PATH
get $FILE
quit
END_SCRIPT
exit 0
