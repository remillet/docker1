#!/bin/bash
HOST='nightly.collectionspace.org'
USER='anonymous'
PASSWD='download@collectionspace.org'
PATH=pub/collectionspace/releases/$1
FILE=$2

/usr/bin/ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
passive
cd $PATH
get $FILE
quit
END_SCRIPT
exit 0
