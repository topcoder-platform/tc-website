BASE=../..
SEPARATOR=":"
CP=""
CP=$CP$SEPARATOR$BASE/conf
CP=$CP$SEPARATOR$BASE/resources
CP=$CP$SEPARATOR$BASE/lib/jars/log4j.jar
CP=$CP$SEPARATOR$BASE/lib/jars/ifxjdbc.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jdbc7.0-1.2.jar
CP=$CP$SEPARATOR$BASE/lib/jars/xml/xerces/xercesImpl.jar
CP=$CP$SEPARATOR$BASE/build/classes
CP=$CP$SEPARATOR$BASE/lib/jars/tcsUtil.jar
CP=$CP$SEPARATOR$BASE/lib/jars/configmanager2.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jboss/xercesImpl.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jboss/xml-apis.jar
CP=$CP$SEPARATOR$BASE/lib/jars/log4j-1.2.7.jar
CP=$CP$SEPARATOR$BASE/lib/bin/shared.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jackson-core-2.6.1.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jackson-databind-2.6.1.jar
CP=$CP$SEPARATOR$BASE/lib/jars/jackson-annotations-2.6.1.jar
CP=$CP$SEPARATOR$BASE/lib/jars/fluent-hc-4.5.1.jar
CP=$CP$SEPARATOR$BASE/lib/jars/httpclient-4.5.1.jar
CP=$CP$SEPARATOR$BASE/lib/jars/httpcore-4.4.3.jar
CP=$CP$SEPARATOR$BASE/lib/jars/commons-logging-1.2.jar
CP=$CP$SEPARATOR$BASE/lib/jars/ifxjdbc.jar

echo $CP
java -Dhttps.protocols=TLSv1.2 -cp $CP com.topcoder.dde.util.DWLoad.RatingQubits
