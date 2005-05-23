#!/bin/ksh
JAVA=/usr/java/bin/java
LOGFILE=emailEngine.log


CLASSPATH=""
CLASSPATH=$CLASSPATH:$WEB_HOME/lib/jars/jmsFix.jar
CLASSPATH=$CLASSPATH:$WEB_HOME/lib/jars/xalan-j_2_4_0/bin/xalan.jar
CLASSPATH=$CLASSPATH:$WEB_HOME/lib/jars/xalan-j_2_4_0/bin/xml-apis.jar
CLASSPATH=$CLASSPATH:$WEB_HOME/lib/jars/xalan-j_2_4_0/bin/xercesImpl.jar

CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/weblogic510sp12.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/weblogic510sp12boot.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/weblogicaux.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/weblog.jar
CLASSPATH=${CLASSPATH}:${JAVA_HOME}/lib/tools.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/log4j-1.2.7.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/activation.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/mail.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/mailapi.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/smtp.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/pop3.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/ifxjdbc.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/bfograph.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/junit.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/upload.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/configmanager2.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/object_formatter.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/tcs/catalog.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/tcs/ddeforum.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/tcs/forum.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/jars/tcs/user.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/lib/bin/Jive.jar
CLASSPATH=${CLASSPATH}:${WEB_HOME}/resources:
CLASSPATH=${CLASSPATH}:${WEB_HOME}/build/ejb_jars/EmailServices.jar:
CLASSPATH=${CLASSPATH}:${WEB_HOME}/build/classes:

echo "********************************************"
echo $CLASSPATH
echo "********************************************"

${JAVA} -Xms32m -Xmx32m -Dweblogic.system.executeThreadCount=10 -Dweblogic.system.percentSocketReaders=50 -cp $CLASSPATH com.topcoder.shared.email.EmailJobScheduler >> ${LOGFILE} 2>&1 &
echo "The EmailEngine has finished executing and is starting up again..." >> ${LOGFILE}
