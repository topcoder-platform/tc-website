#!/bin/bash

CP=""
CP=$CP:/home/tc/web/resources/studio
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/lib/jars/tcs/base_exception/2.0.0/base_exception.jar
CP=$CP:/home/tc/web/lib/jars/tcs/configuration_manager/2.1.5/configuration_manager.jar
CP=$CP:/home/tc/web/lib/jars/tcs/configuration_api/1.0.0/configuration_api.jar
CP=$CP:/home/tc/web/lib/jars/tcs/db_connection_factory/1.1/db_connection_factory.jar
CP=$CP:/home/tc/web/lib/jars/tcs/id_generator/3.0/id_generator.jar
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/shared/build
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/lib/shared.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar

java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/tc/web/scripts/studio/contest_migration.xml
