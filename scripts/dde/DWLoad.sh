#!/bin/sh
BASE=../..
CP=""
CP=$CP:$BASE/resources
CP=$CP:$BASE/lib/jars/log4j-1.2.7.jar
CP=$CP:$BASE/lib/jars/ifxjdbc.jar
CP=$CP:$BASE/lib/jars/tcs/shared.jar
CP=$CP:$BASE/build/classes
CP=$CP:$BASE/build/tcs_dw_loader.jar
echo $CP
java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile $1
