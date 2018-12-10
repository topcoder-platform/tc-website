#!/bin/sh
BASE=../..
CP=$CP:$BASE/resources
CP=$CP:$BASE/lib/jars/log4j-1.2.7.jar
CP=$CP:$BASE/lib/jars/ifxjdbc.jar
CP=$CP:$BASE/lib/jars/tcs/base_exception/2.0.0/base_exception.jar
CP=$CP:$BASE/lib/jars/tcs/configuration_api/1.1.0/configuration_api.jar
CP=$CP:$BASE/lib/jars/tcs/configuration_persistence/1.0.2/configuration_persistence.jar
CP=$CP:$BASE/lib/jars/tcs/logging_wrapper.jar
CP=$CP:$BASE/lib/jars/tcs/command_line_utility/1.0.0/command_line_utility.jar
CP=$CP:$BASE/lib/jars/tcs/db_connection_factory/1.1/db_connection_factory.jar
CP=$CP:$BASE/lib/jars/tcs/object_factory/2.0/object_factory.jar
CP=$CP:$BASE/lib/jars/tcs/object_factory_configuration_api_plugin/1.0.0/object_factory_configuration_api_plugin.jar
CP=$CP:$BASE/lib/jars/tcs/object_formatter/1.0.0/object_formatter.jar
CP=$CP:$BASE/lib/jars/tcs/typesafe_enum/1.0/typesafe_enum.jar
CP=$CP:$BASE/lib/jars/tcs/configuration_manager/2.1.5/configuration_manager.jar
CP=$CP:$BASE/lib/jars/tcs/reliability_calculator/1.0.4/reliability_calculator.jar

java -cp $CP com.topcoder.reliability.ReliabilityCalculationUtility -c ReliabilityCalculationUtility.properties
