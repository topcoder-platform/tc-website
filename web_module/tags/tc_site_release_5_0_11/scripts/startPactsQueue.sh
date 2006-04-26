#!/bin/bash

JAVA=/usr/java/bin/java

echo "WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF
echo $CLASSPATH
echo "WTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTFWTF

#while ((1))
#do
  echo "SHELL: Starting pacts queue"
  nohup $JAVA -client -Xms33m -Xmx64m -Xss512k -cp $CLASSPATH -Dweblogic.system.executeThreadCount=10 -Dweblogic.system.percentSocketReaders=50 com.topcoder.web.tc.controller.legacy.pacts.messaging.request.QueueRequest pactsQueue > pactsQueue.log 2>&1 &
  echo "SHELL: The pacts queue has started up..."
#done

