#!/bin/ksh

JAVACMD=java
BASE=..
MAIN=com.topcoder.server.distCache.CacheServerMain
PROCESSOR=DefaultProcessor
CMD=usage
MAXMEM=1024m
LOGFILE=cache-`date +%Y-%m-%d-%H-%M-%S`.log

CP=$BASE/build/classes
CP=$CP:$BASE/resources
CP=$CP:$BASE/lib/jars/nbio.jar
CP=$CP:$CLASSPATH

if [[ $1 != "" ]] ; then
        CMD=$1
        shift
fi

if [ "$CMD" = "start" ] ; then
    nohup $JAVACMD -cp $CP -Xmx$MAXMEM $MAIN -primary $@ >$LOGFILE 2>&1 &
    echo $! > primary.pid
    nohup $JAVACMD -cp $CP -Xmx$MAXMEM $MAIN -secondary $@ >$LOGFILE 2>&1 &
    echo $! > secondary.pid
        echo "start maxmem=$MAXMEM"
elif [ "$CMD" = "stop" ] ; then
    kill `cat primary.pid`
    kill `cat secondary.pid`
    rm -f primary.pid
    rm -f secondary.pid
        echo "stopped"
else
    echo "Usage:"
    echo "runcache.sh (run|start|stop)"
    echo "      start - start cache"
    echo "      stop  - stop cache"
fi
