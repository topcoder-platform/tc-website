CP=$CP:/home/tc/web/resources
CP=$CP:/home/tc/web/resources/db_utilities
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/lib/shared.jar
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/log4j-boot.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.pacts.PayReliabilityBonus -xmlfile payReliabilityBonus.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
