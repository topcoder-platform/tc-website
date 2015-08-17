BASE=../..
CP=""
CP=$CP:$BASE/conf
CP=$CP:$BASE/resources
CP=$CP:$BASE/lib/jars/log4j.jar
CP=$CP:$BASE/lib/jars/ifxjdbc.jar
CP=$CP:$BASE/lib/jars/jdbc7.0-1.2.jar
CP=$CP:$BASE/lib/jars/xml/xerces/xercesImpl.jar
CP=$CP:$BASE/build/classes
CP=$CP:$BASE/lib/jars/tcsUtil.jar
CP=$CP:$BASE/lib/jars/configmanager2.jar
CP=$CP:$BASE/lib/jars/jboss/xercesImpl.jar
CP=$CP:$BASE/lib/jars/jboss/xml-apis.jar

nohup java -cp $CP com.topcoder.dde.util.DWLoad.RatingQubits >> ./ratings.log 2>&1 &
