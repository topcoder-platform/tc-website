#!/bin/ksh
JAVA=/usr/java/bin/java
LOGFILE=emailEngine.log

${JAVA} -Xms32m -Xmx32m -Dweblogic.system.executeThreadCount=10 -Dweblogic.system.percentSocketReaders=50 com.topcoder.shared.email.EmailJobScheduler >> ${LOGFILE} 2>&1 &
echo "The EmailEngine has finished executing and is starting up again..." >> ${LOGFILE}


