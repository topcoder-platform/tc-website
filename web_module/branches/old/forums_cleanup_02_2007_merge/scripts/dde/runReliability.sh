#!/bin/sh
CP=../../conf:../../build/classes:../../lib/jars/ifxjdbc.jar:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar:../../lib/jars/tcsUtil.jar:../../lib/jars/jboss/xml-apis.jar:../../lib/jars/jboss/xalan.jar:../../lib/jars/jboss/xercesImpl.jar:$CLASSPATH
echo $CP

java -cp $CP com.topcoder.dde.util.DWLoad.ReliabilityRating
