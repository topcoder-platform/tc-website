#!/bin/sh
CP=../conf:../build/classes:../jars/configmanager_xerces-1.4.4.jar:../jars/tcsUtil.jar:../jars/idgenerator.jar:$CLASSPATH

java -cp $CP com.topcoder.dde.util.DWLoad.DataConversion -xmlfile DataConversion.xml
