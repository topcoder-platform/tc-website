CP=""
CP=$CP:/home/web/web/resources
CP=$CP:/home/web/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/web/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/web/web/build/classes
CP=$CP:/home/web/web/lib/bin/shared.jar

java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/web/web/scripts/dwload/loadtcs.xml

java -cp $CP com.topcoder.shared.util.dwload.CacheClearer
