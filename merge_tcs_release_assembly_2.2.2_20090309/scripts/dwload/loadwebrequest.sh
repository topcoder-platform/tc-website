CLASSPATH=""
CLASSPATH=$CLASSPATH:/home/coder/web/resources
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/log4j-1.2.7.jar
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/ifxjdbc.jar
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/jdbc7.0-1.2.jar
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/xerces.jar
CLASSPATH=$CLASSPATH:/home/coder/web/build/classes
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/idgenerator.jar
CLASSPATH=$CLASSPATH:/home/coder/web/lib/jars/jboss/jbossall-client.jar

nohup java -Xmx1024m -cp $CLASSPATH com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/coder/web/scripts/dwload/loadwebrequest.xml >> /home/coder/web/scripts/dwload/request_load.log 2>&1 &
