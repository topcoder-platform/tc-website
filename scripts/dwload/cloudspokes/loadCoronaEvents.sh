#!/bin/bash

#
# Launches the tool for loading Client User Statistics data into warehouse database
#

CP=../../resources
CP=$CP:../../build/classes
CP=$CP:$CLASSPATH
CP=$CP:../../lib/jars/log4j-1.2.7.jar
CP=$CP:../../lib/jars/ifxjdbc.jar
CP=$CP:../../lib/jars/jboss/jbossall-client.jar
CP=$CP:../../lib/jars/tcs/shared.jar
CP=$CP:../../../lib/jars/commons-httpclient-3.0.1.jar
CP=$CP:../../../lib/jars/commons-logging.jar
CP=$CP:../../../lib/jars/commons-codec-1.3.jar
CP=$CP:../../../lib/jars/jackson-core-asl.jar
CP=$CP:../../../lib/jars/jackson-mapper-asl.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.dwload.cloudspokes.CoronaEventLoadUtility -xmlfile loadCoronaEvents.xml$@ > ./loadCoronaEvents.out 2>&1 &
tail -f loadCoronaEvents.out

