#!/bin/ksh
COMPONENTS="1073"
DIR="TESTING_CHEAT_LOGS"

if [ ! -d $DIR ]
then
  mkdir $DIR
fi

  CLASSPATH="."
  CLASSPATH=$CLASSPATH:../lib/jars/ifxjdbc.jar
  CLASSPATH=$CLASSPATH:../lib/jars/log4j-1.2.7.jar
  CLASSPATH=$CLASSPATH:../build/classes
  CLASSPATH=$CLASSPATH:../lib/jars/weblogic510sp11.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblogic510sp11boot.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblogicaux.jar
  CLASSPATH=$CLASSPATH:../lib/jars/weblog.jar
  CLASSPATH=$CLASSPATH:../resources

  for COMPONENT in $COMPONENTS
  do
    echo "running for round $ROUND component $COMPONENT"
    java -Xms256m -Xmx512m -Xss256k -cp $CLASSPATH com.topcoder.utilities.cheaterChecker.Testing $COMPONENT > "./${DIR}/component_$COMPONENT_`date +%Y-%m-%d-%H-%M-%S`.log" 2>&1 &
  done


