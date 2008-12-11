CP=../../resources:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar:../../lib/jars/tcs/email_engine.jar:../../lib/jars/jboss/mail.jar:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar:../../lib/jars/activation.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.tcs.ApplyRBoardRules -xmlfile applyRBoardRules.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
