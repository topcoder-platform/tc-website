#!/usr/local/bin/bash

  JAVA=/usr/bin/java

  CLASSPATH="."
  CLASSPATH=$CLASSPATH:../lib/bin/screening.jar
  CLASSPATH=$CLASSPATH:../lib/bin/shared.jar
  CLASSPATH=$CLASSPATH:../lib/jars/idgenerator.jar
  CLASSPATH=$CLASSPATH:../lib/jars/ifxjdbc.jar
  CLASSPATH=$CLASSPATH:../lib/jars/jboss/jbossall-client.jar
  CLASSPATH=$CLASSPATH:../lib/jars/log4j-1.2.7.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/base_exception.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/compression_utility/2.0/compression_utility.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/configuration_manager/2.1.3/configuration_manager.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/data_validation/1.0/data_validation.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/db_connection_factory/1.0/db_connection_factory.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/directory_validation/1.0/directory_validation.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/executable_wrapper.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/file_class/1.0/file_class.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/generic_event_manager/1.0/generic_event_manager.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/magic_numbers/1.0/magic_numbers.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/typesafe_enum/1.0/typesafe_enum.jar
  CLASSPATH=$CLASSPATH:../lib/jars/tcs/xmi_parser/1.0/xmi_parser.jar
  CLASSPATH=$CLASSPATH:../lib/jars/xercesImpl.jar
  CLASSPATH=$CLASSPATH:../lib/jars/xmlParserAPIs.jar
  CLASSPATH=$CLASSPATH:../resources/automatic_screening


echo $CLASSPATH

#while ((1))
#do
  echo "SHELL: Starting automatic screening"
  nohup $JAVA -cp $CLASSPATH com.topcoder.apps.screening.ScreeningJob $1 $2 $3 > automatic_screening.log 2>&1 &
  echo "SHELL: Automatic screening has started up..."
#done
