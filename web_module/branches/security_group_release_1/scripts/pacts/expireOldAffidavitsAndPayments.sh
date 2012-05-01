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

CP=""
CP=$CP/home/coder/web/build/ejb_jars/PactsClientServices.jar:
CP=$CP:/home/coder/web/resources
CP=$CP:/home/coder/web/resources/db_utilities
CP=$CP:/home/coder/web/build/classes
CP=$CP:/home/coder/web/lib/bin/shared.jar
CP=$CP:/home/coder/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/coder/web/lib/jars/log4j-boot.jar
CP=$CP:/home/coder/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/coder/web/lib/jars/tcs/configuration_manager/2.1.5/configuration_manager.jar
CP=$CP:/home/coder/web/lib/jars/jboss/jbossall-client.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.pacts.ExpireOldAffidavitsAndPayments -xmlfile /home/coder/web/scripts/pacts/expireOldAffidavitsAndPayments.xml $@ >> /home/coder/web/scripts/pacts/expire.out 2>&1 &
