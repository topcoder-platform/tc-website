#####################################################################################################################
#
# Author: pulky
# Version: 1.0
# Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
#
# Description: This script will pay pending withholdings. 
#              The script accepts two parameters:
#                - release_period_days: this parameter specifies how many days after project completion,
#                  the withholding must be released. 
#                - onlyAnalyze: this parameter specified if only analysis is required (changes won't be persisted)
#                  The default was changed to true to avoid running this by mistake, so in order to apply changes
#                  "-onlyAnalyze false" must be specified.
#
# Note: Parameters can be specified via payWithholding.xml or using command line arguments.
#
#####################################################################################################################


CP=$CP:/home/tc/web/resources
CP=$CP:/home/tc/web/resources/db_utilities
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/lib/shared.jar
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/log4j-boot.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.pacts.PayWithholdings -xmlfile payWithholdings.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
