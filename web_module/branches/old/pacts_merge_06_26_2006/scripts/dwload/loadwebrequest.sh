
CLASSPATH=""
CLASSPATH=$CLASSPATH:../../lib/jars/weblogic510sp12.jar
CLASSPATH=$CLASSPATH:../../lib/jars/weblogicaux.jar
CLASSPATH=$CLASSPATH:../../lib/jars/weblog.jar
CLASSPATH=$CLASSPATH:../../resources
CLASSPATH=$CLASSPATH:../../lib/jars/log4j-1.2.7.jar
CLASSPATH=$CLASSPATH:../../lib/jars/ifxjdbc.jar
CLASSPATH=$CLASSPATH:../../lib/jars/jdbc7.0-1.2.jar
CLASSPATH=$CLASSPATH:../../lib/jars/xerces.jar
CLASSPATH=$CLASSPATH:../../build/classes
CLASSPATH=$CLASSPATH:../../lib/jars/idgenerator.jar

nohup /usr/java/bin/java -cp $CLASSPATH com.topcoder.utilities.dwload.TCLoadUtility -xmlfile loadwebrequest.xml > ./nohup.out 2>&1 &
tail -f nohup.out

