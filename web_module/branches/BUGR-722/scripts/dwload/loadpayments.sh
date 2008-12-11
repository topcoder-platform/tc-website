CP=""
CP=$CP:/home/coder/web/resources
CP=$CP:/home/coder/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/coder/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/coder/web/build/classes
CP=$CP:/home/coder/web/lib/jars/jboss/jbossall-client.jar
CP=$CP:/home/coder/web/lib/jars/jboss/jboss-cache.jar
CP=$CP:/home/coder/web/lib/jars/jboss/jboss-system.jar
CP=$CP:/home/coder/web/lib/jars/security.jar
CP=$CP:/home/coder/web/lib/jars/jboss/jgroups.jar

nohup java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/coder/web/scripts/dwload/loadpayments.xml >> /home/coder/web/scripts/dwload/payments_load.log 2>&1 &
