#!/bin/ksh
CP=""
CP=$CP:../../resources
CP=$CP:../../lib/jars/log4j-1.2.7.jar
CP=$CP:../../lib/jars/ifxjdbc.jar
CP=$CP:../../lib/jars/xml/2.2.D14/xerces.jar
CP=$CP:../../build/classes

nohup java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile loadlong.xml > ./nohup.out 2>&1 &
tail -f nohup.out