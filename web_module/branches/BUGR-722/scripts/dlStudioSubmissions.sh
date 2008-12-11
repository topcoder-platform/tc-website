#!/bin/ksh

CP=""
CP=$CP:../lib/bin/shared.jar
#CP=$CP:../lib/bin/build.jar
CP=$CP:../build/classes
CP=$CP:../lib/jars/log4j-1.2.7.jar
CP=$CP:../lib/jars/ifxjdbc.jar
CP=$CP:../resources
CP=$CP:$CLASSPATH

echo $CP

java -cp $CP com.topcoder.web.oracle.SubmissionDownloaderUtil $@
