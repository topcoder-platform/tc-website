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

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.dwload.ClientUserStatsLoadUtility -xmlfile loadClientUserStatsData.xml $@ > ./loadClientUserStatsData.out 2>&1 &
tail -f loadClientUserStatsData.out

