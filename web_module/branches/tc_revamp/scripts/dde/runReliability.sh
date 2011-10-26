#!/bin/sh
CP=$CP:/home/tc/web/conf
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
CP=$CP:/home/tc/web/lib/jars/tcsUtil.jar:
CP=$CP:/home/tc/web/lib/jars/jboss/xml-apis.jar:
CP=$CP:/home/tc/web/lib/jars/jboss/xalan.jar:
CP=$CP:/home/tc/web/lib/jars/jboss/xercesImpl.jar:
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/lib/shared.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/conf/cache.properties
echo $CP

java -cp $CP com.topcoder.dde.util.DWLoad.ReliabilityRating