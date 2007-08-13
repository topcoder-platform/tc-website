#!/bin/ksh

MAXMEM=1024m
JAVACMD=${JAVA_HOME}/bin/java
BASE=..
MAIN=com.topcoder.shared.distCache.CacheServerMain
PROCESSOR=DefaultProcessor
CMD=usage
LOGFILE=cache-`date +%Y-%m-%d-%H-%M-%S`.log

CP=""
CP=$CP:$BASE/lib/bin/shared.jar
CP=$CP:$BASE/lib/bin/build.jar
#CP=$CP:$BASE/build/classes
CP=$CP:$BASE/lib/jars/log4j-1.2.7.jar
CP=$CP:$BASE/lib/jars/nbio.jar
CP=$CP:$BASE/resources
CP=$CP:$CLASSPATH

echo $CP

#OPTS="-cp $CP -Xloggc:gc.log -XX:MaxTenuringThreshold=0 -XX:SurvivorRatio=128 -Xms$MAXMEM -Xmx$MAXMEM -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -XX:+PrintTenuringDistribution -XX:+PrintHeapAtGC -XX:CMSInitiatingOccupancyFraction=60 -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000"

OPTIONS="-cp $CP -Xms$MAXMEM -Xmx$MAXMEM -server"

OPTIONS="$OPTIONS -Xloggc:gc.log"
OPTIONS="$OPTIONS -verbose:gc"
OPTIONS="$OPTIONS -XX:+PrintGCTimeStamps"
OPTIONS="$OPTIONS -XX:+PrintGCDetails"
OPTIONS="$OPTIONS -XX:+PrintGCApplicationStoppedTime"
OPTIONS="$OPTIONS -XX:+PrintHeapAtGC"
OPTIONS="$OPTIONS -XX:+PrintTenuringDistribution"

#simulate promoteall 
OPTIONS="$OPTIONS -XX:SurvivorRatio=1024"                #make eden occupy the majority of the new gen
OPTIONS="$OPTIONS -XX:MaxTenuringThreshold=0"            #do not copy objects to survivor, promote directly to the older gen

OPTIONS="$OPTIONS -XX:+UseParNewGC"                      #parallelize the new generation gc
OPTIONS="$OPTIONS -XX:+UseConcMarkSweepGC"               #use concurrent old generation collector
OPTIONS="$OPTIONS -XX:+CMSParallelRemarkEnabled"         #try and speed up the remark
OPTIONS="$OPTIONS -XX:CMSInitiatingOccupancyFraction=30" #percent of allocated space in the old gen necessary to trigger cms
OPTIONS="$OPTIONS -XX:PretenureSizeThreshold=100"        #objects larger than 100 bytes are created in the old gen
#OPTIONS="$OPTIONS -XX:+CMSPermGenSweepingEnabled"       #use the concurrent collector on the perm gen too
#OPTIONS="$OPTIONS -XX:+CMSClassUnloadingEnabled"        #need this to go with above
#OPTIONS="$OPTIONS -XX:+UseCMSCompactAtFullCollection    #this keeps the tenured gen from getting fragmented
#OPTIONS="$OPTIONS -XX:ParallelGCThreads=3"              #tell the collector how man threads to use, #cpu is default
OPTIONS="$OPTIONS -Dsun.rmi.dgc.client.gcInterval=0x7FFFFFFFFFFFFFFE"
OPTIONS="$OPTIONS -Dsun.rmi.dgc.server.gcInterval=0x7FFFFFFFFFFFFFFE"


if [[ $1 != "" ]] ; then
        CMD=$1
        shift
fi

if [ "$CMD" = "start" ] ; then
    nohup $JAVACMD $OPTIONS $MAIN -primary $@ >$LOGFILE 2>&1 &
    echo $! > primary.pid
#    nohup $JAVACMD $OPTIONS $MAIN -secondary $@ >$LOGFILE 2>&1 &
#    echo $! > secondary.pid
        echo "start maxmem=$MAXMEM"
elif [ "$CMD" = "stop" ] ; then
    kill `cat primary.pid`
#    kill `cat secondary.pid`
    rm -f primary.pid
#    rm -f secondary.pid
        echo "stopped"
else
    echo "Usage:"
    echo "runcache.sh (run|start|stop)"
    echo "      start - start cache"
    echo "      stop  - stop cache"
fi
