#!/bin/bash

#
# Launches the tool for migrating the data (ID, handle, password, status) for TopCoder
# member accounts from COMMON_OLTP database to OpenLDAP server
#

CP=../../resources
CP=$CP:../../build/classes
CP=$CP:$CLASSPATH
CP=$CP:../../lib/jars/log4j-1.2.7.jar
CP=$CP:../../lib/jars/log4j-boot.jar
CP=$CP:../../lib/jars/ifxjdbc.jar

#CP=$CP:../../lib/jars/tcs/email_engine.jar
#CP=$CP:../../lib/jars/jboss/mail.jar
#CP=$CP:../../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
#CP=$CP:../../lib/jars/activation.jar

CP=$CP:../../lib/jars/tcs/base_exception/2.0.0/base_exception.jar
CP=$CP:../../lib/jars/tcs/ldap_sdk_interface.jar
CP=$CP:../../lib/jars/netscape_ldap_sdk.jar

CP=$CP:../../../shared/build/artifacts/shared-SNAPSHOT.jar

nohup java  -cp $CP com.topcoder.shared.util.sql.DBUtilityLauncher com.topcoder.utilities.sql.UserDataLDAPMigrationTool -xmlfile userDataLDAPMigrationTool.xml $@ > ./nohup.out 2>&1 &
tail -f nohup.out
