#!/bin/ksh
ROUND=4485
COMPONENTS="1473 1242 1243 1470 1487"
DIR="CHEAT_LOGS"

if [ ! -d $DIR ]
then
  mkdir $DIR
fi

  CLASSPATH="."
  CLASSPATH=$CLASSPATH:/app/lib/jars/ifxjdbc.jar
  CLASSPATH=$CLASSPATH:/app/lib/jars/log4j-1.2.6.jar
  CLASSPATH=$CLASSPATH:/app/build/classes
  CLASSPATH=$CLASSPATH:/app/lib/jars/weblogic510sp11.jar
  CLASSPATH=$CLASSPATH:/app/lib/jars/weblogic510sp11boot.jar
  CLASSPATH=$CLASSPATH:/app/lib/jars/weblogicaux.jar
  CLASSPATH=$CLASSPATH:/app/lib/jars/weblog.jar
  CLASSPATH=$CLASSPATH:/app/resources

  echo $CLASSPATH



  for COMPONENT in $COMPONENTS
  do
    echo "running for round $ROUND component $COMPONENT"
    java -Xms256m -Xmx512m -Xss256k -cp $CLASSPATH com.topcoder.utilities.fraudDetect.FraudDetect $ROUND $COMPONE
NT > "./${DIR}/round_${ROUND}__component_$COMPONENT.log" 2>&1 &
  done

