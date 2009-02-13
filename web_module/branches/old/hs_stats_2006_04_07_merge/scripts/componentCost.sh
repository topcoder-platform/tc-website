#!/bin/ksh

  CLASSPATH="."
  CLASSPATH=$CLASSPATH:../lib/jars/ifxjdbc.jar
  CLASSPATH=$CLASSPATH:../lib/jars/log4j-1.2.7.jar
  CLASSPATH=$CLASSPATH:../build/classes
  CLASSPATH=$CLASSPATH:../lib/jars/weblogic510sp11.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblogic510sp11boot.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblogicaux.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblog.jar
  CLASSPATH=$CLASSPATH:../resources

#  echo $CLASSPATH

java -Xms256m -Xmx512m -Xss256k -cp $CLASSPATH com.topcoder.web.tc.model.SoftwareComponent $1 $2 $3 $4
