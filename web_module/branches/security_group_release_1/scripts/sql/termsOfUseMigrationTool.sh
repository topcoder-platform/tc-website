#####################################################################################################################
#
# Author: pulky
# Version: 1.0
# Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
#
# Description: This script will migrate existing information from terms_of_use table to the new schema.
#              The main goal of this script is to get the blob column (text) and save the first 50 chars to title
#              column.
#
# Note: Remember to update termsOfUseMigrationTool.xml for the appropriate datasource.
#
#####################################################################################################################

CP=../../lib/bin/shared.jar:../../resources:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.sql.TermsOfUseMigrationTool -xmlfile termsOfUseMigrationTool.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
