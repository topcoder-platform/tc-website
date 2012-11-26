CP=../../resources
CP=$CP:../../build/classes
CP=$CP:$CLASSPATH
CP=$CP:../../lib/jars/log4j-1.2.7.jar
CP=$CP:../../lib/jars/log4j-boot.jar
CP=$CP:../../lib/jars/ifxjdbc.jar
CP=$CP:../../lib/jars/tcs/email_engine.jar
CP=$CP:../../lib/jars/jboss/mail.jar
CP=$CP:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
CP=$CP:../../lib/jars/activation.jar
CP=$CP:../../../shared/build/artifacts/shared-SNAPSHOT.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.sql.DBUpdateTool -xmlfile dbUpdateTool.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
