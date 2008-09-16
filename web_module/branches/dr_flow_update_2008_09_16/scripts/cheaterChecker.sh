#!/bin/ksh
ROUND=2008
COMPONENTS="1505 1507 1551"
DATASOURCE=HS_OLTP
DIR="CHEAT_LOGS"

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

  echo $CLASSPATH



  for COMPONENT in $COMPONENTS
  do
    echo "running for round $ROUND component $COMPONENT"
    java -Xms256m -Xmx512m -Xss256k -cp $CLASSPATH com.topcoder.utilities.fraudDetect.FraudDetect $DATASOURCE $ROUND $COMPONENT > "./${DIR}/round_${ROUND}__component_$COMPONENT.log" 2>&1 &
  done
