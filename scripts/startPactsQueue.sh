#!/bin/bash

if [ $# == 0 ]
then
  echo '------------------------------------------------------------------'
  echo ': Usage      :  pacts.sh type threads                          '
  echo ':                                                                 '
  echo ': Parameters :  pacts# -- The unique id of this pacts       '
  echo '------------------------------------------------------------------'
  exit
fi

JAVA=/usr/java/bin/java
ID=$1
TYPE="compileQueue"


echo "WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF
echo $CLASSPATH
echo "WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF

#while ((1))
#do
  echo "SHELL: Starting pacts number $ID"
  nohup $JAVA -client -Xms33m -Xmx64m -Xss512k -cp $CLASSPATH -Dweblogic.system.executeThreadCount=10 -Dweblogic.system.percentSocketReaders=50 com.topcoder.web.tc.controller.legacy.pacts.messaging.request.QueueRequest pactsQueue 1 > pactsQueue.log 2>&1 &
  echo "SHELL: The pacts has finished executing and is starting up again..."
#done

