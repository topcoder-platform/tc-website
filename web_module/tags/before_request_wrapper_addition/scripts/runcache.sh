#!/bin/ksh

MAXMEM=128m
JAVACMD=/usr/j2sdk1.4.2/bin/java
BASE=..
MAIN=com.topcoder.shared.distCache.CacheServerMain
PROCESSOR=DefaultProcessor
CMD=usage
LOGFILE=cache-`date +%Y-%m-%d-%H-%M-%S`.log

CP=$BASE/build/classes
CP=$CP:$BASE/resources
CP=$CP:$BASE/lib/jars/nbio.jar
CP=$CP:$CLASSPATH

OPTS="-cp $CP -XX:MaxTenuringThreshold=0 -XX:SurvivorRatio=20000 -Xms$MAXMEM -Xmx$MAXMEM -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps"
#OPTS="-cp $CP -XX:MaxTenuringThreshold=0 -XX:SurvivorRatio=20000 -Xms$MAXMEM -Xmx$MAXMEM -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintHeapAtGC"


##############################################
#1. -XX:MaxTenuringThreshold=0 
#2. -XX:SurvivorRatio=20000 
#3. -Xms128m
#4. -Xmx128m
#5. -XX:+ UseConcMarkSweepGC 
#6. -XX:+UseParNewGC 
#
#1.  simulate promote all
#2.  make eden large
#3.  force a large permananent area
#4.  force a large permananent area
#5.  use the concurrent old generation gc
#6.  use the parallel new generation gc
##############################################

if [[ $1 != "" ]] ; then
        CMD=$1
        shift
fi

if [ "$CMD" = "start" ] ; then
    nohup $JAVACMD $OPTS $MAIN -primary $@ >$LOGFILE 2>&1 &
    echo $! > primary.pid
    nohup $JAVACMD $OPTS $MAIN -secondary $@ >$LOGFILE 2>&1 &
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
