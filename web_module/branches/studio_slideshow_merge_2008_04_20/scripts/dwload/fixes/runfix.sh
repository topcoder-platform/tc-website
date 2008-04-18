DIR=/home/coder

CP=""
CP=$CP:$DIR/web/resources
CP=$CP:$DIR/web/lib/jars/log4j-1.2.7.jar
CP=$CP:$DIR/web/lib/jars/ifxjdbc.jar
CP=$CP:$DIR/web/build/classes
CP=$CP:$DIR/web/lib/jars/jboss/jboss-cache.jar
CP=$CP:$DIR/web/lib/jars/jboss/jbossall-client.jar
CP=$CP:$DIR/web/lib/jars/jboss/jboss-system.jar
CP=$CP:$DIR/web/lib/jars/jboss/jgroups.jar

nohup java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile $1 >> nohup.out 2>&1 &
tail -f nohup.out
