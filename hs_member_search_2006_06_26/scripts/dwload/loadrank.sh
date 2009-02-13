CP=../../resources:../../build/classes:$CLASSPATH:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/log4j-boot.jar:../../lib/jars/ifxjdbc.jar
nohup java -cp $CP com.topcoder.utilities.dwload.TCLoadUtility -xmlfile loadrank.xml > ./nohup.out 2>&1 &
tail -f nohup.out

