nohup java -cp "../../resources:../../lib/jars/log4j-1.2.7.jar:../../lib/jars/ifxjdbc.jar:../../lib/jars/jdbc7.0-1.2.jar:../../lib/jars/xerces.jar:../../build/classes:../../lib/jars/idgenerator.jar" com.topcoder.utilities.dwload.TCLoadUtility -xmlfile loadreqtrack.xml > ./nohup.out 2>&1 &
tail -f nohup.out

