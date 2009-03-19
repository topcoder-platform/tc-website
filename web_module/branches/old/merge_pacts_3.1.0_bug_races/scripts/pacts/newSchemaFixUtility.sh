CP=../../resources:../../resources/db_utilities:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar:../../lib/jars/jboss/jbossall-client.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.pacts.NewSchemaFixUtility -xmlfile newSchemaFixUtility.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
