CP=../../resources/db_utilities:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar:../../lib/jars/tcs/id_generator/3.0/id_generator.jar:../../lib/jars/tcs/base_exception.jar:../../lib/jars/tcs/db_connection_factory/1.0/db_connection_factory.jar:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar:../../lib/jars/jboss/xercesImpl.jar



nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.tcs.ScreeningSchemaFixUtility -xmlfile screeningSchemaFix.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
