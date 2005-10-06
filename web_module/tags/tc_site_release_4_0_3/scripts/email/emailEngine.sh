#!/bin/ksh
JAVA=$JAVA_HOME/bin/java
LOGFILE=emailEngine.log


CLASSPATH=""
CLASSPATH=$CLASSPATH:../../lib/jars/jmsFix.jar
CLASSPATH=$CLASSPATH:../../lib/jars/xalan-j_2_4_0/bin/xalan.jar
CLASSPATH=$CLASSPATH:../../lib/jars/xalan-j_2_4_0/bin/xml-apis.jar
CLASSPATH=$CLASSPATH:../../lib/jars/xalan-j_2_4_0/bin/xercesImpl.jar

CLASSPATH=${CLASSPATH}:${JAVA_HOME}/lib/tools.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/jboss/jbossall-client.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/jboss/mail.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/log4j-1.2.7.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/activation.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/mail.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/mailapi.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/smtp.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/pop3.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/ifxjdbc.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/bfograph.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/junit.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/upload.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/configmanager2.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/object_formatter.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/tcs/catalog.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/tcs/ddeforum.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/tcs/forum.jar
CLASSPATH=${CLASSPATH}:../../lib/jars/tcs/user.jar
CLASSPATH=${CLASSPATH}:../..//lib/bin/Jive.jar
CLASSPATH=${CLASSPATH}:../../resources
CLASSPATH=${CLASSPATH}:${JBOSS_HOME}/server/all/deploy/EmailServices.jar
CLASSPATH=${CLASSPATH}:../../build/classes

echo "********************************************"
echo $CLASSPATH
echo "********************************************"

${JAVA} -Xms32m -Xmx32m -Dweblogic.system.executeThreadCount=10 -Dweblogic.system.percentSocketReaders=50 -cp $CLASSPATH com.topcoder.shared.email.EmailJobScheduler >> ${LOGFILE} 2>&1 &
echo "The EmailEngine has finished executing and is starting up again..." >> ${LOGFILE}
