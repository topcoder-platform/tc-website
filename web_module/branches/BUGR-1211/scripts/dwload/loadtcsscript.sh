CP=""
CP=$CP:/home/tc/web/resources
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/shared/build
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/lib/shared.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/conf/cache.properties

java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/tc/web/scripts/dwload/loadtcs.xml

java -cp $CP com.topcoder.shared.util.dwload.CacheClearer
